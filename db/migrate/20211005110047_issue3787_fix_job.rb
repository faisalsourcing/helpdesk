#DevsQuest, https://devsquest.com/

class Issue3787FixJob < ActiveRecord::Migration[6.0]
  def change

    # return if it's a new setup
    return if !Setting.exists?(name: 'system_init_done')

    Scheduler.find_by(name: 'Delete old upload cache entries.').update(error_message: nil, status: nil, active: true)
  end
end
