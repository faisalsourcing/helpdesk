#DevsQuest, https://devsquest.com/

require 'rails_helper'

RSpec.describe Channel::Filter::FollowUpAssignment, type: :channel_filter do

  context 'with group follow_up_assignment true' do
    let(:group) { create(:group, follow_up_assignment: true) }

    context 'when ticket closed' do
      let(:ticket) { create(:ticket, group: group, state: Ticket::State.find_by(name: 'closed')) }

      it 'does not change the owner' do
        mail = {
          'x-devsquest-ticket-id': ticket.id
        }

        filter(mail)

        expect(mail[:'x-devsquest-ticket-followup-owner']).to be_nil
      end
    end

    context 'when ticket open' do
      let(:ticket) { create(:ticket, group: group, state: Ticket::State.find_by(name: 'open')) }

      it 'does not change the owner' do
        mail = {
          'x-devsquest-ticket-id': ticket.id
        }

        filter(mail)

        expect(mail[:'x-devsquest-ticket-followup-owner']).to be_nil
      end
    end
  end

  context 'with group follow_up_assignment false' do
    let(:group) { create(:group, follow_up_assignment: false) }

    context 'when ticket closed' do
      let(:ticket) { create(:ticket, group: group, state: Ticket::State.find_by(name: 'closed')) }

      it 'does change the owner' do
        mail = {
          'x-devsquest-ticket-id': ticket.id
        }

        filter(mail)

        expect(mail[:'x-devsquest-ticket-followup-owner']).to eq(User.lookup(id: 1).login)
      end
    end

    context 'when ticket open' do
      let(:ticket) { create(:ticket, group: group, state: Ticket::State.find_by(name: 'open')) }

      it 'does not change the owner' do
        mail = {
          'x-devsquest-ticket-id': ticket.id
        }

        filter(mail)

        expect(mail[:'x-devsquest-ticket-followup-owner']).to be_nil
      end
    end
  end
end
