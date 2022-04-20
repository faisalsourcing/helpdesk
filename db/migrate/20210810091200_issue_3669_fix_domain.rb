#DevsQuest, https://devsquest.com/

class Issue3669FixDomain < ActiveRecord::Migration[6.0]
  def change
    return if !Setting.exists?(name: 'system_init_done')

    Channel.where(area: ['Google::Account', 'Microsoft365::Account']).each do |channel|
      channel.options[:outbound][:options].delete(:domain)
      channel.save!
    end
  end
end
