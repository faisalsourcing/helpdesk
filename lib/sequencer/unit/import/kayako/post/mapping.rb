#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module Post
          class Mapping < Sequencer::Unit::Base
            include ::Sequencer::Unit::Import::Common::Mapping::Mixin::ProvideMapped

            uses :instance, :resource, :created_by_id, :article_sender_id, :article_source_channel
            provides :mapped

            def process
              provide_mapped do
                {
                  ticket_id:     instance.id,
                  sender_id:     article_sender_id,
                  created_by_id: created_by_id,
                  updated_by_id: created_by_id,
                }.merge(article_source_channel.mapping)
              end
            end
          end
        end
      end
    end
  end
end
