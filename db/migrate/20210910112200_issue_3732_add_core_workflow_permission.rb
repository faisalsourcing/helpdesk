#DevsQuest, https://devsquest.com/

class Issue3732AddCoreWorkflowPermission < ActiveRecord::Migration[6.0]
  def change
    # return if it's a new setup
    return if !Setting.exists?(name: 'system_init_done')

    Permission.create_if_not_exists(
      name:        'admin.core_workflow',
      note:        'Manage %s',
      preferences: {
        translations: ['Core Workflow']
      },
    )
  end
end
