#DevsQuest, https://devsquest.com/

class History::Object < ApplicationModel
  include ChecksHtmlSanitized

  sanitized_html :note
end
