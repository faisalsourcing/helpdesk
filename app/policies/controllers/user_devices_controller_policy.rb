#DevsQuest, https://devsquest.com/

class Controllers::UserDevicesControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('user_preferences.device')
end
