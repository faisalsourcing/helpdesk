#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module User
          class Password < Sequencer::Unit::Common::Provider::Named

            uses :initiator

            private

            def password
              # set the used import key as the admin password
              # since we have no other confidential value
              # that is known to devsquest and the User
              return Setting.get('import_kayako_endpoint_password') if initiator

              # otherwise set an empty password so the user
              # has to re-set a new password for devsquest
              ''
            end
          end
        end
      end
    end
  end
end
