#DevsQuest, https://devsquest.com/

class InclusiveWording < ActiveRecord::Migration[6.0]
  def up

    # return if it's a new setup
    return if !Setting.exists?(name: 'system_init_done')

    rename_column :chats, :whitelisted_websites, :allowed_websites
    Chat.reset_column_information
  end
end
