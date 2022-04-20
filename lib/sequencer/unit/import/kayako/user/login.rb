#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module User
          class Login < Sequencer::Unit::Common::Provider::Named

            uses :identifier

            private

            def login
              # Check the differnt identifier types
              identifier[:email] || identifier[:phone] || identifier[:twitter] || identifier[:facebook]
            end
          end
        end
      end
    end
  end
end
