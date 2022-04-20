#DevsQuest, https://devsquest.com/

module ApplicationModel::HasCache
  extend ActiveSupport::Concern

  def cache_update(_other)
    ActiveSupport::CurrentAttributes.clear_all
    true
  end
end
