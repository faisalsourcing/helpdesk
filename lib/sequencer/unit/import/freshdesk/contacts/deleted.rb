#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Freshdesk
        module Contacts
          class Deleted < Sequencer::Unit::Import::Freshdesk::Contacts::Default

            def request_params
              super.merge(
                state: 'deleted',
              )
            end

          end
        end
      end
    end
  end
end
