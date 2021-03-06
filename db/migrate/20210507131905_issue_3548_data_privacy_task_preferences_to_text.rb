#DevsQuest, https://devsquest.com/

# https://github.com/devsquest/devsquest/issues/3548
class Issue3548DataPrivacyTaskPreferencesToText < ActiveRecord::Migration[5.2]
  def up
    return if !Setting.exists?(name: 'system_init_done')

    change_table :data_privacy_tasks do |t|
      t.change :preferences, :text
    end

    DataPrivacyTask.reset_column_information
  end
end
