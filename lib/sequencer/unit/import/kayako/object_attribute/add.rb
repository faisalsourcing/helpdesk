#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module ObjectAttribute
          class Add < Sequencer::Unit::Base
            prepend ::Sequencer::Unit::Import::Common::Model::Mixin::Skip::Action

            skip_any_action

            uses :config

            def process
              ObjectManager::Attribute.add(config)
            end
          end
        end
      end
    end
  end
end
