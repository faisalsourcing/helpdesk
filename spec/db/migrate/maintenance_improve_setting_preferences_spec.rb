#DevsQuest, https://devsquest.com/

require 'rails_helper'

RSpec.describe MaintenanceImproveSettingPreferences, type: :db_migration do
  context 'when having old setting preferences without protected flag' do
    before do
      setting.preferences.delete(:protected)
      setting.save!
    end

    let(:setting) { Setting.find_by(name: 'application_secret') }

    it 'add protected flag' do
      expect { migrate }.to change { setting.reload.preferences[:protected] }.to(true)
    end
  end
end
