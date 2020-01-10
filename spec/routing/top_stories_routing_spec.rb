require 'rails_helper'

RSpec.describe TopStoriesController do
  describe '#index' do
    it { expect(get('/top_stories')).to route_to('top_stories#index') }
    it { expect(top_stories_path).to eq('/top_stories') }
    it { expect(get('/')).to route_to('top_stories#index') }
  end
end
