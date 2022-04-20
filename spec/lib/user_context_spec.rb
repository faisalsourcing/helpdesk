#DevsQuest, https://devsquest.com/

require 'rails_helper'

RSpec.describe UserContext do
  subject(:user_context) { described_class.new(user, token) }

  describe '#permissions?' do
    context 'when user with ticket.agent permission' do
      let(:user)  { create(:user, roles: [create(:agent_role)]) }
      let(:token) { nil }

      it { is_expected.to be_permissions('ticket.agent') }
      it { is_expected.not_to be_permissions('admin') }
    end

    # https://github.com/devsquest/devsquest/issues/3186
    context 'when user with ticket.agent permission and token created by user who doesn\'t' do
      let(:user)        { create(:user, roles: [create(:agent_role)]) }
      let(:token_owner) { create(:user, roles: [create(:role, :admin)]) }
      let(:token)       { create(:token, user: token_owner, preferences: { permission: %w[ticket.agent] }) }

      it { is_expected.to be_permissions('ticket.agent') }
      it { is_expected.not_to be_permissions('admin') }
    end
  end
end
