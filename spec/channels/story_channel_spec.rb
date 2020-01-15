require 'rails_helper'

RSpec.describe StoryChannel, type: :channel do
  before { stub_connection }

  context 'when query is not present' do
    before { subscribe }

    it 'allows subscription' do
      expect(subscription).to be_confirmed
    end

    it 'subscribes to story_channel channel' do
      expect(subscription).to have_stream_from('story_channel')
    end
  end

  context 'when query is present' do
    before { subscribe(query: 'abc with spaces and áccent') }

    it 'allows subscription' do
      expect(subscription).to be_confirmed
    end

    it 'subscribes to story_channel channel' do
      expect(subscription).to have_stream_from('story_channel-abc-with-spaces-and-accent')
    end
  end
end
