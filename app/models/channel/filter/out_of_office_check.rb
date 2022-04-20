#DevsQuest, https://devsquest.com/

module Channel::Filter::OutOfOfficeCheck

  def self.run(_channel, mail, _transaction_params)

    mail[ :'x-devsquest-out-of-office' ] = false

    # check ms out of office characteristics
    if mail[ :'x-auto-response-suppress' ]
      return if !mail[ :'x-auto-response-suppress' ].match?(%r{all}i)
      return if !mail[ :'x-ms-exchange-inbox-rules-loop' ]

      mail[ :'x-devsquest-out-of-office' ] = true
      return
    end

    if mail[ :'auto-submitted' ]

      # check zimbra out of office characteristics
      if mail[ :'auto-submitted' ].match?(%r{vacation}i)
        mail[ :'x-devsquest-out-of-office' ] = true
      end

      # check cloud out of office characteristics
      if mail[ :'auto-submitted' ].match?(%r{auto-replied;\sowner-email=}i)
        mail[ :'x-devsquest-out-of-office' ] = true
      end

      # gmail check out of office characteristics
      if mail[ :'auto-submitted' ] =~ %r{auto-replied}i && mail[ :subject ] =~ %r{vacation}i
        mail[ :'x-devsquest-out-of-office' ] = true
      end

      return
    end

    true
  end

end
