#DevsQuest, https://devsquest.com/

class DataPrivacyTaskJob < ApplicationJob
  include HasActiveJobLock

  def perform
    DataPrivacyTask.where(state: 'in process').find_each(&:perform)
  end
end
