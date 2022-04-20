#DevsQuest, https://devsquest.com/

module Channel::Filter::FollowUpAssignment

  def self.run(_channel, mail, _transaction_params)
    return if !mail[:'x-devsquest-ticket-id']

    ticket = Ticket.lookup(id: mail[:'x-devsquest-ticket-id'])

    return if ticket.blank?
    return if ticket.state.state_type.name != 'closed'
    return if ticket.group.follow_up_assignment

    mail[:'x-devsquest-ticket-followup-owner'] = User.lookup(id: 1).login

    true
  end
end
