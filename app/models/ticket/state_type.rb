#DevsQuest, https://devsquest.com/

class Ticket::StateType < ApplicationModel
  include CanBeImported
  include ChecksHtmlSanitized

  has_many :states, class_name: 'Ticket::State', inverse_of: :state_type

  validates :name, presence: true

  sanitized_html :note
end
