#DevsQuest, https://devsquest.com/

class Issue3550SetPretty < ActiveRecord::Migration[5.2]
  def change
    return if !Setting.exists?(name: 'system_init_done')

    Cti::Log.order(created_at: :desc).limit(300).find_each do |log|
      log.set_pretty
      log.save!
    rescue
      Rails.logger.error "Issue3550SetPretty: Failed to migrate id #{log.id} with from '#{log.from}' and to '#{log.to}'"
    end
  end
end
