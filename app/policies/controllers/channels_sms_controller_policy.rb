#DevsQuest, https://devsquest.com/

class Controllers::ChannelsSmsControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.channel_sms')
end
