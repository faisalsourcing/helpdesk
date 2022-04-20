#DevsQuest, https://devsquest.com/

class Object
  def to_utf8(**options)
    to_s.utf8_encode(**options)
  end
end
