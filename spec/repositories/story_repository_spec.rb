require 'rails_helper'

describe StoryRepository do
  describe '#top_stories' do
    subject { described_class.new }

    context 'when top stories could be fetched' do
      it 'fetches IDs of stories' do
        VCR.use_cassette('success_fetching_top_stories') do
          expect(subject.top_stories.first).to be_kind_of(Numeric)
        end
      end
    end

    context 'when top stories could not be fetched' do
      it 'returns empty array' do
        VCR.use_cassette('failure_fetching_top_stories') do
          expect(subject.top_stories).to eq([])
        end
      end
    end
  end
end
