require 'rails_helper'

RSpec.describe StoriesController, type: :routing do
  describe '#index' do
    it { expect(get('/stories')).to route_to('stories#index') }
    it { expect(stories_path).to eq('/stories') }
  end
end
