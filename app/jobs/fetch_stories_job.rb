class FetchStoriesJob < ActiveJob::Base
  sidekiq_options queue: 'stories'

  def perform(query = '')
    SearchStories.call(query)
  end
end
