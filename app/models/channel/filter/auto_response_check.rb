#DevsQuest, https://devsquest.com/

module Channel::Filter::AutoResponseCheck

  def self.run(_channel, mail, _transaction_params)

    header_is_auto_response_exists = mail.key?(:'x-devsquest-is-auto-response')
    mail[ :'x-devsquest-is-auto-response' ] = header_is_auto_response_exists ? ActiveModel::Type::Boolean.new.cast(mail[ :'x-devsquest-is-auto-response' ]) : true

    header_send_auto_response_exists = mail.key?(:'x-devsquest-send-auto-response')
    mail[ :'x-devsquest-send-auto-response' ] = header_send_auto_response_exists ? ActiveModel::Type::Boolean.new.cast(mail[ :'x-devsquest-send-auto-response' ]) : !mail[ :'x-devsquest-is-auto-response' ]

    mail[ :'x-devsquest-article-preferences' ] ||= {}
    mail[ :'x-devsquest-article-preferences' ]['send-auto-response'] = mail[ :'x-devsquest-send-auto-response' ]
    mail[ :'x-devsquest-article-preferences' ]['is-auto-response'] = mail[ :'x-devsquest-is-auto-response' ]

    # Skip the auto response checks, if the header already exists.
    return if header_is_auto_response_exists

    # do not send an auto response if one of the following headers exists
    return if mail[ :'list-unsubscribe' ] && mail[ :'list-unsubscribe' ] =~ %r{...}
    return if mail[ :'x-loop' ] && mail[ :'x-loop' ] =~ %r{(yes|true)}i
    return if mail[ :precedence ] && mail[ :precedence ] =~ %r{(bulk|list|junk)}i
    return if mail[ :'auto-submitted' ] && mail[ :'auto-submitted' ] =~ %r{auto-(generated|replied)}i
    return if mail[ :'x-auto-response-suppress' ] && mail[ :'x-auto-response-suppress' ] =~ %r{all}i

    # do not send an auto response if sender is system itself
    message_id = mail[ :message_id ]
    if message_id
      fqdn = Setting.get('fqdn')
      return if message_id.match?(%r{@#{Regexp.quote(fqdn)}}i)
    end

    mail[ :'x-devsquest-send-auto-response' ] = true if !header_send_auto_response_exists
    mail[ :'x-devsquest-is-auto-response' ] = false

    mail[ :'x-devsquest-article-preferences' ]['send-auto-response'] = mail[ :'x-devsquest-send-auto-response' ]
    mail[ :'x-devsquest-article-preferences' ]['is-auto-response'] = false

  end
end
