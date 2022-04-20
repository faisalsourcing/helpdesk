#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module ObjectAttribute
          module AttributeType
            class Regex < Sequencer::Unit::Import::Kayako::ObjectAttribute::AttributeType::Text
              private

              def data_type_specific_options
                super.merge(
                  regex: attribute['regular_expression'],
                )
              end
            end
          end
        end
      end
    end
  end
end
