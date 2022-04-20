#DevsQuest, https://devsquest.com/

class ElasticSearchLower65Obsolete < ActiveRecord::Migration[5.2]
  def change

    # return if it's a new setup
    return if !Setting.exists?(name: 'system_init_done')

    Setting.find_by(name: 'es_multi_index').destroy
  end
end