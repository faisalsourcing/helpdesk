#DevsQuest, https://devsquest.com/

RSpec.configure do |config| # rubocop:disable Style/SymbolProc
  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
