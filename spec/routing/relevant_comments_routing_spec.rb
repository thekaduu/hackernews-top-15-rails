require 'rails_helper'

RSpec.describe RelevantCommentsController, type: :routing do
  describe '#index' do
    it { expect(get('/top_stories/12345/relevant_comments')).to route_to('relevant_comments#index', top_story_id: "12345") }
    it { expect(top_story_relevant_comments_path(12345)).to eq('/top_stories/12345/relevant_comments') }
  end
end
