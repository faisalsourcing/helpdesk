#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module ObjectAttribute
          class Skip < Sequencer::Unit::Base

            uses :resource
            provides :action

            def process
              return if (!resource['is_system'] && skip_attribute_types.exclude?(resource['type'])) || allowed_system_attributes.include?(resource['key'])

              state.provide(:action, :skipped)
            end

            private

            def skip_attribute_types
              @skip_attribute_types ||= %w[FILE CHECKBOX]
            end

            def allowed_system_attributes
              @allowed_system_attributes ||= %w[type]
            end
          end
        end
      end
    end
  end
end
