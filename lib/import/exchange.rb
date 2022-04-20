#DevsQuest, https://devsquest.com/

module Import
  class Exchange < Import::IntegrationBase
    include Import::Mixin::Sequence

    private

    def sequence_name
      'Import::Exchange::FolderContacts'
    end
  end
end
