#DevsQuest, https://devsquest.com/

if Rails.application.config.cache_store.first.eql? :mem_cache_store
  Rails.logger.info 'Using memcached as Rails cache store.'
else
  Rails.logger.info "Using devsquest's file store as Rails cache store."
end
