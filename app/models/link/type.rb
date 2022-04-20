#DevsQuest, https://devsquest.com/

class Link::Type < ApplicationModel
  include ChecksHtmlSanitized

  validates :name, presence: true

  sanitized_html :note
end
