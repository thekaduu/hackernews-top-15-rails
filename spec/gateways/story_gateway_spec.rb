# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoryGateway, type: :model do
  subject { described_class.new }

  describe '#search_stories' do
    context 'when there are less than 10 stories with query in title' do
      it 'returns only the stories available' do
        VCR.use_cassette('success_searching_new_stories_less_than_10') do
          result = subject.search_stories('push')
          expect(result.count).to eq(1)
        end
      end
    end

    it 'returns only 10 most recent stories' do
      VCR.use_cassette('success_searching_new_stories') do
        result = subject.search_stories('the')
        expect(result.count).to eq(10)
      end
    end

    it 'returns only stories with query in title' do
      VCR.use_cassette('success_searching_new_stories') do
        result = subject.search_stories('the')
        (0...10).each { |i| expect(result[i]['title']).to match(/the/i) }
      end
    end
  end

  describe '#top_stories' do
    context 'when top stories could be fetched' do
      it 'fetches IDs of stories' do
        VCR.use_cassette('success_fetching_top_stories') do
          result = subject.top_stories
          story = result.first
          expect(story['id']).to eq(22038496)
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
