#DevsQuest, https://devsquest.com/

module OtrsImportJsonFixtureHelper
  def json_fixture(file)
    JSON.parse(File.read("spec/fixtures/files/#{file}.json"))
  end
end

RSpec.configure do |config|
  # devsquest specific helpers
  config.include OtrsImportJsonFixtureHelper

  # skip OtrsImportJsonFixtureHelper functions in the backtraces to lower noise
  config.backtrace_exclusion_patterns << %r{/spec/spec_helper/}
end
