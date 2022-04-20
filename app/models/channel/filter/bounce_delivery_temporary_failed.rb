#DevsQuest, https://devsquest.com/

module Channel::Filter::BounceDeliveryTemporaryFailed

  def self.run(_channel, mail, _transaction_params)
    return if !mail[:mail_instance]
    return if !mail[:attachments]
    return if mail[:mail_instance].action != 'delayed'
    return if mail[:mail_instance].retryable? != true
    return if mail[:mail_instance].error_status != '4.4.1'

    # if header is available, do change current ticket state
    mail[:'x-devsquest-out-of-office'] = true

    true
  end
end
