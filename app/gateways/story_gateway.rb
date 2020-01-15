# frozen_string_literal: true

class StoryGateway < ApplicationGateway
  STORIES_MAX_AMOUNT = 10
  SEARCH_STORIES_MAX_COUNT = 35

  def search_stories(query = '')
    [].tap do |stories|
      search_in('newstories.json') do |response|
        search_count = 0
        story_ids = JSON.parse(response.body)
        while stories.count < STORIES_MAX_AMOUNT
          story = item_repository.find(story_ids.shift)
          stories << story if story_matches?(story, query)
          search_count += 1
          break if search_count >= SEARCH_STORIES_MAX_COUNT
        end
      end
    end
  end

  def top_stories
    search_in('topstories.json') do |response|
      story_ids = JSON.parse(response.body)[0...15]
      items = item_repository.find_all(story_ids)
    end
  end

  private

  def search_in(path, &block)
    response = get(path)
    response.status == 200 ? yield(response) : []
  end

  def story_matches?(story, query)
    !story['deleted'] && story['title'].downcase.include?(query.downcase)
  end

  def item_repository
    @item_repository ||= ItemGateway.new
  end
end
