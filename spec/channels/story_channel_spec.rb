require 'rails_helper'

RSpec.describe StoryChannel, type: :channel do
  before do
    stub_connection
    subscribe
  end

  it 'allows subscription' do
    expect(subscription).to be_confirmed
  end

  it 'subscribes to story_channel channel' do
    expect(subscription).to have_stream_from('story_channel')
  end
end
