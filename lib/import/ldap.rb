#DevsQuest, https://devsquest.com/

module Import
  class Ldap < Import::IntegrationBase
    include Import::Mixin::Sequence

    private

    def sequence_name
      'Import::Ldap::Users'
    end
  end
end
