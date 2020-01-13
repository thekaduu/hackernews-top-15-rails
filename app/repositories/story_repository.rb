# frozen_string_literal: true

class StoryRepository < ApplicationRepository
  def top_stories
    response = get('topstories.json')

    if response.status == 200
      JSON.parse(response.body)
    else
      []
    end
  end
end
