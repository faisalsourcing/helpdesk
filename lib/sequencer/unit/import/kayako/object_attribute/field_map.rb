#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module ObjectAttribute
          class FieldMap < Sequencer::Unit::Base
            prepend ::Sequencer::Unit::Import::Common::Model::Mixin::Skip::Action

            skip_any_action

            optional :action

            uses :field_map, :model_class, :resource, :sanitized_name

            def process
              field_map[model_class.name] ||= {}
              field_map[model_class.name][ resource['key'] ] = sanitized_name
            end
          end
        end
      end
    end
  end
end
