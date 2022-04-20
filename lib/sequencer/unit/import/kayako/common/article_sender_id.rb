#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        module Common
          class ArticleSenderId < Sequencer::Unit::Common::Provider::Named

            uses :created_by_id

            private

            def article_sender_id
              return article_sender('Customer') if author.role?('Customer')
              return article_sender('Agent') if author.role?('Agent')

              article_sender('System')
            end

            def author
              @author ||= ::User.find(created_by_id)
            end

            def article_sender(name)
              ::Ticket::Article::Sender.select(:id).find_by(name: name).id
            end
          end
        end
      end
    end
  end
end
