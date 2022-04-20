#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module Case
          class OwnerId < Sequencer::Unit::Common::Provider::Named

            uses :resource, :id_map

            private

            def owner_id
              id_map['User'].fetch(resource['assigned_agent']&.fetch('id'), 1)
            end
          end
        end
      end
    end
  end
end
