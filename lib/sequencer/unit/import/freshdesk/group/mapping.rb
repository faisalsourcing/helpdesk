#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Freshdesk
        module Group
          class Mapping < Sequencer::Unit::Base
            include ::Sequencer::Unit::Import::Common::Mapping::Mixin::ProvideMapped

            uses :resource

            def process
              provide_mapped do
                {
                  name: resource['name'],
                  note: resource['description'],
                }
              end
            end
          end
        end
      end
    end
  end
end
