#DevsQuest, https://devsquest.com/

Cache = Class.new do
  def method_missing(method, ...)
    super if !respond_to_missing? method

    ActiveSupport::Deprecation.warn("Method 'Cache.#{method}' is deprecated. 'Rails.cache.#{method}' instead.")
    Rails.cache.send(method, ...)
  end

  def respond_to_missing?(...)
    Rails.cache.respond_to?(...)
  end
end.new
