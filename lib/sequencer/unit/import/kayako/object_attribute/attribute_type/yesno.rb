#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module ObjectAttribute
          module AttributeType
            class Yesno < Sequencer::Unit::Import::Kayako::ObjectAttribute::AttributeType::Base
              def local_value(value)
                value == 'yes'
              end

              private

              def data_type
                'boolean'
              end

              def data_type_specific_options
                {
                  default: false,
                  options: {
                    true  => 'yes',
                    false => 'no',
                  },
                }
              end
            end
          end
        end
      end
    end
  end
end
