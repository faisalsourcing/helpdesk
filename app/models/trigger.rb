#DevsQuest, https://devsquest.com/

class Trigger < ApplicationModel
  include ChecksConditionValidation
  include ChecksHtmlSanitized
  include ChecksPerformValidation
  include CanSeed

  include Trigger::Assets

  store     :condition
  store     :perform
  validates :name, presence: true

  sanitized_html :note
end
