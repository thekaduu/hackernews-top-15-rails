# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RelevantCommentsController, type: :routing do
  describe '#index' do
    it { expect(get('/stories/12345/relevant_comments')).to route_to('relevant_comments#index', story_id: "12345") }
    it { expect(story_relevant_comments_path(12345)).to eq('/stories/12345/relevant_comments') }
  end
end
