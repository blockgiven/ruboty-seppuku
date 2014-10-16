module Ruboty
  module Seppuku
    module Actions
      class Seppuku < Ruboty::Actions::Base
        def call
          Kernel.exit
        end
      end
    end
  end
end
