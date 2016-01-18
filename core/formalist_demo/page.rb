require "formalist_demo/assets"

module FormalistDemo
  # This is our main layout context that we inject into view
  #
  # Methods available in this object will be available in the main layout
  class Page
    attr_reader :config
    attr_accessor :flash_messages

    def initialize(config)
      @config = config
      @flash_messages = {}
    end

    def assets
      @assets ||= Assets.new(
        env: config.env,
        root: config.root,
        server_url: Container.options.assets_server_url
      )
    end
  end
end
