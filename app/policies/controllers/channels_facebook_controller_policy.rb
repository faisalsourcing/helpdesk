#DevsQuest, https://devsquest.com/

class Controllers::ChannelsFacebookControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.channel_facebook')
end
