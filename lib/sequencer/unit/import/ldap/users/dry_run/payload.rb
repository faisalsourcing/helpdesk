#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Ldap
        module Users
          module DryRun
            class Payload < Sequencer::Unit::Import::Common::ImportJob::Payload::ToAttribute
              provides :ldap_config
            end
          end
        end
      end
    end
  end
end
