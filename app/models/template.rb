#DevsQuest, https://devsquest.com/

class Template < ApplicationModel
  include ChecksClientNotification

  store     :options
  validates :name, presence: true

  association_attributes_ignored :user
end
