class StoryChannel < ApplicationCable::Channel
  def subscribed
    stream_name = "story_channel"
    stream_name += "-#{params[:query].parameterize}" if params[:query].present?
    stream_from stream_name
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
