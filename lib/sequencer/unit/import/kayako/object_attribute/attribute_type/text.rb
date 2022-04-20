#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module ObjectAttribute
          module AttributeType
            class Text < Sequencer::Unit::Import::Kayako::ObjectAttribute::AttributeType::Base
              private

              def data_type
                'input'
              end

              def data_type_specific_options
                {
                  type:      'text',
                  maxlength: 255,
                }
              end
            end
          end
        end
      end
    end
  end
end
