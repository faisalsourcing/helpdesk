#DevsQuest, https://devsquest.com/

class Karma

  def self.score_by_user(user)
    last_activity_log = Karma::ActivityLog.where(user_id: user.id).order(id: :desc).first
    return 0 if !last_activity_log

    last_activity_log.score_total
  end

end
