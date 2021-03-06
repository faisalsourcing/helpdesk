#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Freshdesk
        module ObjectAttribute
          class MigrationExecute < Sequencer::Unit::Base
            prepend ::Sequencer::Unit::Import::Common::Model::Mixin::Skip::Action

            skip_any_action

            def process
              ObjectManager::Attribute.migration_execute(false)
            end
          end
        end
      end
    end
  end
end
