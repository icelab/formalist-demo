# Formalist Demo

### First-time setup

```
./bin/setup
```

### Running the app

```
bundle exec shotgun -p 3000 -o 0.0.0.0 config.ru
npm start
```

Then load [http://localhost:3000/demo](http://localhost:3000/demo).


# FormalistDemo

Welcome! You’ve generated an app using dry-web-roda.

## First steps

1. Run `bundle`
1. Review `config/settings.yml` (and make a copy at `config/settings.example.yml` if you want to keep example settings checked in)
1. Create a `formalist_demo_development` database
1. Add your own steps to `bin/setup`
1. Run the app with `bundle exec shotgun -p 3000 -o 0.0.0.0 config.ru`
1. Initialize git with `git init` and make your initial commit
