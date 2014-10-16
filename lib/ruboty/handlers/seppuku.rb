module Ruboty
  module Handlers
    class Seppuku < Base
      env :HEROKU_API_KEY,  'heroku api key',  optional: true
      env :HEROKU_APP_NAME, 'heroku app name', optional: true

      on /(seppuku|harakiri|切腹|腹切り)/i, name: 'seppuku', description: 'seppuku'

      def seppuku(message)
        Ruboty::Seppuku::Actions::Seppuku.new(message).call
      end
    end
  end
end
