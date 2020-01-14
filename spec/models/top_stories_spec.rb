# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopStories, type: :model do
  describe '.call' do
    it 'instantes a new instance of the TopStories object' do
      expect(described_class).to receive(:new).with('query') { double(call: []) }
      described_class.call('query')
    end

    context 'when query is not provided' do
      it 'instantes a new instance of the TopStories object without query' do
        expect(described_class).to receive(:new).with(nil) { double(call: []) }
        described_class.call
      end
    end
  end

  describe '#call' do
    let(:query) { nil }
    subject { described_class.new(query) }

    context 'when query is nil' do
      it 'invokes StoryRepository' do
        expect_any_instance_of(StoryRepository).to receive(:top_stories) { [] }
        described_class.call
      end

      it 'returns an array of stories' do
        VCR.use_cassette('success_fetching_top_stories') do
          result = subject.call
          expect(result[0]).to be_kind_of(Story)
        end
      end
    end
  end
end
