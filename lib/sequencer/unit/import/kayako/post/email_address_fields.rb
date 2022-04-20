#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module Post
          class EmailAddressFields < Sequencer::Unit::Base

            uses :resource, :id_map
            provides :from, :to, :cc

            def process
              state.provide(:user_id) do
                user_map.fetch(resource.author_id, 1)
              end
            end

          end
        end
      end
    end
  end
end
