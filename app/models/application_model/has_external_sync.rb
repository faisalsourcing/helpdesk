#DevsQuest, https://devsquest.com/

module ApplicationModel::HasExternalSync
  extend ActiveSupport::Concern

  included do
    after_destroy :external_sync_destroy
  end

  def external_sync_destroy
    ExternalSync.where(
      object: self.class.to_s,
      o_id:   id,
    ).destroy_all
  end
end
