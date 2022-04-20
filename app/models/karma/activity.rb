#DevsQuest, https://devsquest.com/

class Karma::Activity < ApplicationModel
  self.table_name = 'karma_activities'
  validates :name, presence: true
end
