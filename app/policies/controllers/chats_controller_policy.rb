#DevsQuest, https://devsquest.com/

class Controllers::ChatsControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.channel_chat')
end
