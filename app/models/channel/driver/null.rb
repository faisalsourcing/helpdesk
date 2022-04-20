#DevsQuest, https://devsquest.com/

class Channel::Driver::Null
  def fetchable?(_channel)
    false
  end

  def fetch(...)
    {
      result:  'ok',
      fetched: 0,
      notice:  '',
    }
  end

  def disconnect
    true
  end

  def self.streamable?
    false
  end
end
