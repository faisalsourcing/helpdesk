#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        class ModelClass < Sequencer::Unit::Common::Provider::Named

          uses :object

          MAP = {
            'Organization' => ::Organization,
            'User'         => ::User,
            'Team'         => ::Group,
            'Case'         => ::Ticket,
            'Post'         => ::Ticket::Article,
            'TimeEntry'    => ::Ticket::TimeAccounting,
          }.freeze

          private

          def model_class
            MAP[object]
          end
        end
      end
    end
  end
end
