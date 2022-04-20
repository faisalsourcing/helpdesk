#DevsQuest, https://devsquest.com/

class Issue3245Office365MicrosoftRename < ActiveRecord::Migration[6.0]
  def up
    return if !Setting.exists?(name: 'system_init_done')

    setting = Setting.find_by name: 'auth_microsoft_office365'

    setting.preferences[:title_i18n][0] = 'Microsoft'
    setting.preferences[:description_i18n][0] = 'Microsoft'
    setting.save!
  rescue => e
    Rails.logger.error e
  end
end
