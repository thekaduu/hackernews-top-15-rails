# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoriesFactory, type: :model do
  let(:data) {
    [
      {
        'by' => 'theyeti', 'descendants' => 16, 'id' => 9129911,
        'kids' => [9129990, 9130206, 9130376, 9130273, 9131289, 9131728, 9137773, 9132476],
        'score' => 78, 'text' => '', 'time' => 1425261906,
        'title' => 'Venture Capital in the 1980s', 'type' => 'story',
        'url' => 'http://reactionwheel.net/2015/01/80s-vc.html'
      }
    ]
  }

  subject { described_class.new(data) }

  describe '#call' do
    it 'returns an array of stories' do
      result = subject.call
      expect(result.count).to eq(1)
    end

    it 'instantiates stories correctly' do
      story = subject.call.first
      expect(story.as_json).to eq(data[0])
    end
  end
end
