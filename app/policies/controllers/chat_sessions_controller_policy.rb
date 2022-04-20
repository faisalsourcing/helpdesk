#DevsQuest, https://devsquest.com/

class Controllers::ChatSessionsControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('chat.agent')
end
