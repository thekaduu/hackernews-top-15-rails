# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchStories, type: :model do
  describe '.call' do
    it 'instantes a new instance of the SearchStories object' do
      expect(described_class).to receive(:new).with('abc') { double(call: []) }
      described_class.call('abc')
    end

    context 'when query is not provided' do
      it 'instantes a new instance of the TopStories object without query' do
        expect(described_class).to receive(:new).with('') { double(call: []) }
        described_class.call
      end
    end
  end

  describe '#call' do
    let(:query) { '' }
    subject { described_class.new(query) }

    context 'when query is not present' do
      it 'invokes StoryGateway' do
        expect_any_instance_of(StoryGateway).to receive(:top_stories) { [] }
        subject.call
      end

      it 'returns an array of stories' do
        VCR.use_cassette('success_fetching_top_stories') do
          result = subject.call
          expect(result[0]).to be_kind_of(Story)
        end
      end
    end

    context 'when query is present' do
      let(:query) { 'the' }

      it 'invokes StoryGateway' do
        expect_any_instance_of(StoryGateway).to receive(:search_stories).with(query) { [] }
        subject.call
      end

      it 'returns an array of stories' do
        VCR.use_cassette('success_searching_new_stories') do
          result = subject.call
          expect(result[0]).to be_kind_of(Story)
          expect(result[0].title).to match('the')
        end
      end
    end
  end
end
