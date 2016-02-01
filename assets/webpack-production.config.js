var fs = require("fs");
var path = require("path");
var webpack = require("webpack");
var loadConfig = require("./config");

/**
 * Custom webpack plugins
 */
var ExtractTextPlugin = require("extract-text-webpack-plugin");

/**
 * PostCSS packages
 */

var autoprefixer = require("autoprefixer-core");
var cssimport = require("postcss-import");
var cssnext = require("postcss-cssnext");

/**
 * General configuration
 */
var config  = loadConfig(path.join(__dirname, "config.yml"));
var TARGETS = path.join(__dirname, "targets");
var BUILD   = path.join(__dirname, "build");


/**
 * isDirectory
 *
 * @param  {dir} file Check if the passed path is a directory
 * @return {Boolean}
 */
function isDirectory(dir) {
  return fs.lstatSync(dir).isDirectory();
}


/**
 * isFile
 *
 * @param  {string} file Check if the passed path is a file
 * @return {Boolean}
 */
function isFile(file) {
  return fs.lstatSync(file).isFile();
}


/**
 * createEntries
 *
 * Iterate through the `TARGETS`, find any matching `target.js` files, and
 * return those as entry points for the webpack output.
 */
function createEntries(entries, dir) {
  if (isDirectory(path.join(TARGETS, dir))) {
    var file = path.join(TARGETS, dir, "target.js");
    try {
      isFile(file);
    } catch (e) {
      return;
    }
    entries[dir] = [file];
  }
  return entries;
}


/**
 * Webpack configuration
 */
module.exports = {

  // Set proper context
  context: TARGETS,

  // Generate the `entry` points from the filesystem
  entry: fs.readdirSync(TARGETS).reduce(createEntries, {}),

  // Configure output
  output: {
    // Output into our build directory
    path: BUILD,
    // Template based on keys in entry above
    // Generate hashed names for production
    filename: "[name].js"
  },

  // Plugin/loader specific-configuration
  plugins: [
    new webpack.DefinePlugin({
      DEVELOPMENT: true
    }),
    new ExtractTextPlugin("[name].css", {
      allChunks: true
    })
  ],

  postcss: function() {
    return {
      defaults: [
        cssimport({
          // Add each @import as a dependency so the bundle is rebuilt
          // when imported files change.
          onImport: function (files) {
            files.forEach(this.addDependency);
          }.bind(this)
        }),
        cssnext(),
        autoprefixer
      ],
      cleaner:  [autoprefixer({ browsers: ["last 2 versions"] })]
    };
  },

  // Set the resolve paths to _our_ node_modules
  // For modules
  resolve: {
    fallback: [path.join(__dirname, '../node_modules')]
  },
  // Same issue, for loaders like babel
  resolveLoader: {
    fallback: [path.join(__dirname, '../node_modules')]
  },

  // General configuration
  module: {
    loaders: [
      {
        test: /\.js/,
        loader: "babel?presets[]=react,presets[]=es2015",
        include: TARGETS
      },
      {
        test: /\.(jpe?g|png|gif|svg|woff|ttf|otf|eot|ico)/,
        loader: "file-loader?name=[path][name].[ext]"
      },
      {
        test: /\.html$/,
        loader: "html-loader"
      },
      {
        test: /\.mcss$/,
        // The ExtractTextPlugin pulls all CSS out into static files
        // rather than inside the JavaScript/webpack bundle
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader?modules&importLoaders=1&localIdentName=[name]__[local]___[hash:base64:5]!postcss-loader')
      },
      {
        test: /\.css$/,
        // The ExtractTextPlugin pulls all CSS out into static files
        // rather than inside the JavaScript/webpack bundle
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader!postcss-loader')
      }
    ]
  }

};
