#DevsQuest, https://devsquest.com/

class SettingAddSystemBcc < ActiveRecord::Migration[5.1]
  def up

    # return if it's a new setup
    return if !Setting.exists?(name: 'system_init_done')

    Setting.create_if_not_exists(
      title:       'Bcc address for all outgoing emails',
      name:        'system_bcc',
      area:        'Email::Enhanced',
      description: 'To archive all outgoing emails from devsquest to external, you can store a bcc email address here.',
      options:     {},
      state:       '',
      preferences: { online_service_disable: true },
      frontend:    false
    )
  end

end
