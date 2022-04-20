#DevsQuest, https://devsquest.com/

RSpec.configure do |config|
  config.before(type: :system) do |example|
    sessions_jobs_required = example.metadata.fetch(:sessions_jobs, false)

    next if !sessions_jobs_required

    allow_any_instance_of(Sessions::Backend::Base).to receive(:to_run?).and_return(true) # rubocop:disable RSpec/AnyInstance
  end

  config.around(:each, type: :system) do |example|
    sessions_jobs_required = example.metadata.fetch(:sessions_jobs, false)

    if sessions_jobs_required
      sessions_jobs_thread = Thread.new do
        Sessions.jobs
      end
    end

    example.run

    next if !sessions_jobs_required

    sessions_jobs_thread.exit
    sessions_jobs_thread.join
  end
end
