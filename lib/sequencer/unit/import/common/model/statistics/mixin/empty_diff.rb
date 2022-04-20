#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Common
        module Model
          module Statistics
            module Mixin
              module EmptyDiff
                include Sequencer::Unit::Import::Common::Model::Statistics::Mixin::Common

                def self.included(base)
                  base.provides :statistics_diff
                end

                alias diff empty_diff
              end
            end
          end
        end
      end
    end
  end
end
