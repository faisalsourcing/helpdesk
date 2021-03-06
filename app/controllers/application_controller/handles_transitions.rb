#DevsQuest, https://devsquest.com/

module ApplicationController::HandlesTransitions
  extend ActiveSupport::Concern

  included do
    around_action :handle_transaction
  end

  private

  def handle_transaction
    ApplicationHandleInfo.current = 'application_server'
    PushMessages.init

    yield

    TransactionDispatcher.commit
    PushMessages.finish
    ActiveSupport::Dependencies::Reference.clear!
  ensure
    ApplicationHandleInfo.current = nil
  end
end
