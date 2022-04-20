#DevsQuest, https://devsquest.com/

class OrganizationPolicy < ApplicationPolicy

  def show?
    return true if user.permissions?(['admin', 'ticket.agent'])
    return true if record.id == user.organization_id

    false
  end

  def update?
    return true if user.permissions?(['admin', 'ticket.agent'])

    false
  end
end
