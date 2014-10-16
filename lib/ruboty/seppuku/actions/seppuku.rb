module Ruboty
  module Seppuku
    module Actions
      class Seppuku < Ruboty::Actions::Base
        def call
          seppuku_dyno if heroku?
          Kernel.exit
        end

        private

        def seppuku_dyno
          require 'platform-api'
          heroku  = PlatformAPI.connect(heroku_api_key)
          seppuku = {"process" => "bot", "quantity" => 0}
          heroku.formation.batch_update(heroku_app_name, {"updates" => [seppuku]})
        end

        def heroku?
          heroku_api_key and heroku_app_name
        end

        def heroku_app_name
          ENV['HEROKU_APP_NAME']
        end

        def heroku_api_key
          ENV['HEROKU_API_KEY']
        end
      end
    end
  end
end
