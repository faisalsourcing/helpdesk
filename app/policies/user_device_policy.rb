#DevsQuest, https://devsquest.com/

class UserDevicePolicy < ApplicationPolicy
  def log?
    user&.permissions?('user_preferences.device')
  end
end
