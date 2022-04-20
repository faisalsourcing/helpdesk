#DevsQuest, https://devsquest.com/

module ApplicationModel::HasRecentViews
  extend ActiveSupport::Concern

  included do
    before_destroy :recent_view_destroy
  end

=begin

delete object recent viewed list, will be executed automatically

  model = Model.find(123)
  model.recent_view_destroy

=end

  def recent_view_destroy
    RecentView.log_destroy(self.class.to_s, id)
    true
  end
end
