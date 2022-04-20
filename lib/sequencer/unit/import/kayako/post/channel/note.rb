#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module Post
          module Channel
            class Note < Sequencer::Unit::Import::Kayako::Post::Channel::Base
              def mapping
                super.merge(
                  body:         original_post['body_html'] || original_post['body_text'] || '',
                  content_type: 'text/html',
                )
              end

              private

              def identify_key
                'email'
              end

              def article_type_name
                'note'
              end

              def internal?
                true
              end
            end
          end
        end
      end
    end
  end
end
