#DevsQuest, https://devsquest.com/

class SessionsPolicy < ApplicationPolicy
  def impersonate?
    user.permissions?('admin.user')
  end
end
