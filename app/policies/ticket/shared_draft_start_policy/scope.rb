#DevsQuest, https://devsquest.com/

class Ticket::SharedDraftStartPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope

    def resolve
      scope.none if !user.permissions?(['ticket.agent'])

      scope.where group_id: user.groups.access('change').map(&:id)
    end
  end
end
