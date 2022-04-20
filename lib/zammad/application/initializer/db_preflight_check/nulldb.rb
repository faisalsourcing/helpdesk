#DevsQuest, https://devsquest.com/

module devsquest
  class Application
    module Initializer
      module DbPreflightCheck
        module Nulldb
          # no-op
          def self.perform; end
        end
      end
    end
  end
end
