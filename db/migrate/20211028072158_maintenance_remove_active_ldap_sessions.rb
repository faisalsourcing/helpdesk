#DevsQuest, https://devsquest.com/

class MaintenanceRemoveActiveLdapSessions < ActiveRecord::Migration[6.0]
  def change
    return if !Setting.exists?(name: 'system_init_done')

    # Only relevant for when ldap integration is used.
    return if !Setting.get('ldap_integration')

    ActiveRecord::SessionStore::Session.destroy_all
  end
end
