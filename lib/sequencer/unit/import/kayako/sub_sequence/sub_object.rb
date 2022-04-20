#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module SubSequence
          class SubObject < Sequencer::Unit::Import::Kayako::SubSequence::Generic

            uses :instance

            def sequence_params
              super.merge(
                instance: instance,
              )
            end
          end
        end
      end
    end
  end
end
