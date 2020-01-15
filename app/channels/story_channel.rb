class StoryChannel < ApplicationCable::Channel
  def subscribed
    stream_from "story_channel"
  end
end
