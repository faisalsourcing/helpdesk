#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        class MapId < Sequencer::Unit::Base
          prepend ::Sequencer::Unit::Import::Common::Model::Mixin::Skip::Action

          optional :action

          skip_action :skipped, :failed

          uses :id_map, :model_class, :resource, :instance

          def process
            id_map[model_class.name] ||= {}
            id_map[model_class.name][resource['id']] = instance.id
          end
        end
      end
    end
  end
end
