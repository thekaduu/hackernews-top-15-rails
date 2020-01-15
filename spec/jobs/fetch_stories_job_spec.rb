require 'rails_helper'

describe FetchStoriesJob do
  subject { described_class.new }

  it { is_expected.to be_processed_in('stories') }

  describe '#perform' do
    it 'invokes SearchStories.call' do
      expect(SearchStories).to receive(:call).with('') { [] }
      subject.perform
    end

    context 'when query is present' do
      it 'invokes SearchStories.call with query parameter' do
        expect(SearchStories).to receive(:call).with('abc') { [] }
        subject.perform('abc')
      end
    end
  end
end
