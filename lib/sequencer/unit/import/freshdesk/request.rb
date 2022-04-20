#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Freshdesk
        class Request < Sequencer::Unit::Common::Provider::Attribute
          extend ::Sequencer::Unit::Import::Freshdesk::Requester
          prepend ::Sequencer::Unit::Import::Common::Model::Mixin::Skip::Action

          skip_action :skipped, :failed

          uses :object, :request_params
          provides :response

          private

          def response
            builder = backend.new(
              object:         object,
              request_params: request_params
            )

            self.class.request(
              api_path: builder.api_path,
              params:   builder.params,
            )
          end

          def backend
            "::Sequencer::Unit::Import::Freshdesk::Request::#{object}".safe_constantize || ::Sequencer::Unit::Import::Freshdesk::Request::Generic
          end
        end
      end
    end
  end
end