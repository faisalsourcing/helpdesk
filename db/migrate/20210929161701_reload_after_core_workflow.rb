#DevsQuest, https://devsquest.com/

class ReloadAfterCoreWorkflow < ActiveRecord::Migration[6.0]
  def up

    # return if it's a new setup
    return if !Setting.exists?(name: 'system_init_done')

    AppVersion.set(true, 'app_version')
  end
end
