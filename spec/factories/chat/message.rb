#DevsQuest, https://devsquest.com/

FactoryBot.define do
  factory :'chat/message' do
    chat_session { create(:'chat/session') }
    content { 'test 1234' }
    created_by_id { 1 }
  end
end
