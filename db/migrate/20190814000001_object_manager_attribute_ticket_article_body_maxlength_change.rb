#DevsQuest, https://devsquest.com/

class ObjectManagerAttributeTicketArticleBodyMaxlengthChange < ActiveRecord::Migration[5.1]
  def up
    return if !Setting.exists?(name: 'system_init_done')

    attribute = ObjectManager::Attribute.get(
      object: 'TicketArticle',
      name:   'body',
    )
    return if !attribute

    attribute.data_option[:maxlength] = 150_000
    attribute.save!
  end

end
