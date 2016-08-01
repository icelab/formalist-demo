require "open-uri"

module FormalistDemo
  class Assets
    attr_reader :root
    attr_reader :precompiled
    attr_reader :precompiled_host
    attr_reader :server_link_url
    attr_reader :server_read_url

    def self.new(container = Container)
      super(
        root: container.config.root,
        precompiled: container.settings.precompiled_assets,
        precompiled_host: container.settings.precompiled_assets_host,
        server_link_url: container.settings.assets_server_link_url,
        server_read_url: container.settings.assets_server_read_url,
      )
    end

    def initialize(root:, precompiled:, precompiled_host: nil, server_link_url: nil, server_read_url: nil)
      @root = root
      @precompiled = precompiled
      @precompiled_host = precompiled_host
      @server_link_url = server_link_url
      @server_read_url = server_read_url
    end

    def [](asset)
      if precompiled
        asset_path_from_manifest(asset)
      else
        asset_path_on_server_for_link(asset)
      end
    end

    def read(asset)
      path =
        if precompiled
          asset_path_from_manifest(asset)
        else
          asset_path_on_server_for_read(asset)
        end
      uri = begin
        URI(path)
      rescue URI::InvalidURIError
        nil
      end

      if uri&.absolute?
        open(uri.to_s, "r:UTF-8").read
      elsif File.exist?("#{root}/public#{path}")
        File.read("#{root}/public#{path}")
      else
        raise ArgumentError, "asset not found"
      end
    end

    private

    def asset_path_from_manifest(asset)
      if (hashed_asset = manifest["assets"][asset])
        "#{precompiled_host}/assets/#{hashed_asset}"
      end
    end

    def asset_path_on_server_for_link(asset)
      "#{server_link_url}/assets/#{asset}"
    end

    def asset_path_on_server_for_read(asset)
      "#{server_read_url}/assets/#{asset}"
    end

    def manifest
      @manifest ||= YAML.load_file(manifest_path)
    end

    def manifest_path
      Dir["#{root}/public/assets/manifest_*.json"].first
    end
  end
end
