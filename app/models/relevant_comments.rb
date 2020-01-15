# frozen_string_literal: true

class RelevantComments
  attr_reader :story_id

  def initialize(story_id)
    @story_id = story_id
  end

  def self.call(story_id)
    new(story_id).call
  end

  def call
    RelevantCommentsFactory.call(gateway.relevant_comments(story_id))
  end

  private

  def gateway
    @gateway ||= CommentGateway.new
  end
end
