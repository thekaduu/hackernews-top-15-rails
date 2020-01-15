class FetchStoriesJob < ActiveJob::Base
  queue_as 'stories'

  def perform(query = '')
    @query = query
    publish(render)
  end

  private

  def render
    ApplicationController.render partial: 'stories/stories', locals: { stories: SearchStories.call(@query) }
  end

  def publish(content)
    payload = { message: content, query: @query }
    ActionCable.server.broadcast 'story_channel', payload
  end
end
