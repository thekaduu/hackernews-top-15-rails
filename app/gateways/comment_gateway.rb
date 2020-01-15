# frozen_string_literal: true

class CommentGateway < ApplicationGateway
  RELEVANT_COMMENT_LENGTH = 20

  def relevant_comments(story_id)
    story_data = item_gateway.find(story_id)
    select_relevant_comments(story_data['kids'])
  end

  private

  def select_relevant_comments(comment_ids)
    return [] unless comment_ids

    [].tap do |comments|
      comment_ids[0...10].each do |comment_id|
        comment = item_gateway.find(comment_id)
        comments << comment if comment_is_relevant?(comment)
      end
    end
  end

  def comment_is_relevant?(comment)
    !comment['deleted'] && comment['text'].length >= RELEVANT_COMMENT_SIZE
  end

  def item_gateway
    @item_gateway ||= ItemGateway.new
  end
end
