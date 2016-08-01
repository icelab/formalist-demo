require "dry/web/settings"
require "dry-types"

module FormalistDemo
  class Settings < Dry::Web::Settings
    module Types
      include Dry::Types.module

      module Required
        String = Types::Strict::String.constrained(min_size: 1)
      end
    end

    setting :database_url, Types::Required::String
    setting :session_secret, Types::Required::String

    setting :precompiled_assets, Types::Form::Bool
    setting :precompiled_assets_host, Types::Required::String.optional
    setting :assets_server_link_url, Types::Required::String
    setting :assets_server_read_url, Types::Required::String

    setting :attache_host, Types::Required::String.optional
    setting :attache_secret_key, Types::Required::String.optional
  end
end
