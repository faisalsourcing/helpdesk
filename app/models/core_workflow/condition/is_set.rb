#DevsQuest, https://devsquest.com/

class CoreWorkflow::Condition::IsSet < CoreWorkflow::Condition::Backend
  def match
    return false if object?(Ticket) && @key == 'ticket.owner_id' && value == ['1']
    return false if value == ['']
    return true if value.present?

    false
  end
end
