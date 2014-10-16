module Ruboty
  module Handlers
    class Seppuku < Base
      on /(seppuku|harakiri|切腹|腹切り)/i, name: 'seppuku', description: 'seppuku'

      def seppuku(message)
        Ruboty::Seppuku::Actions::Seppuku.new(message).call
      end
    end
  end
end
