#DevsQuest, https://devsquest.com/

class Ticket::SharedDraftZoomPolicy < ApplicationPolicy
  def update?
    access?(__method__)
  end

  def show?
    access?(__method__)
  end

  def destroy?
    access?(__method__)
  end

  private

  def access?(_method)
    TicketPolicy.new(user, record.ticket).update?
  end
end
