# frozen_string_literal: true

class StoryGateway < ApplicationGateway
  def top_stories
    response = get('topstories.json')

    if response.status == 200
      story_ids = JSON.parse(response.body)[0...15]
      items = item_repository.find_all(story_ids)
    else
      []
    end
  end

  private

  def item_repository
    @item_repository ||= ItemGateway.new
  end
end
