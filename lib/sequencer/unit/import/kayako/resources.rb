#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        class Resources < Sequencer::Unit::Common::Provider::Named
          include ::Sequencer::Unit::Import::Common::Model::Mixin::HandleFailure

          uses :response

          private

          def resources
            body = JSON.parse(response.body)

            body['data']
          rescue => e
            logger.error "Won't be continued, because no response is available."
            handle_failure(e)
          end
        end
      end
    end
  end
end
