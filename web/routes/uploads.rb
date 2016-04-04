require "securerandom"
require "openssl"

module FormalistDemo
  class Application < Rodakase::Application
    route "uploads" do |r|
      r.on "presign" do
        r.post do
          attache_host = FormalistDemo::Container.config.options.attache_host
          secret_key = FormalistDemo::Container.config.options.attache_secret_key
          uuid = SecureRandom.uuid
          expiration = (Time.now + 60*60*3).to_i # 3 hours from now

          {
            url: "#{attache_host}/upload",
            uuid: uuid,
            expiration: expiration,
            hmac: OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha1"), secret_key, "#{uuid}#{expiration}"),
          }
        end
      end
    end
  end
end
