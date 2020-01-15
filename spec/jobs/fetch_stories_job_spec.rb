# frozen_string_literal: true

require 'rails_helper'

describe FetchStoriesJob do
  subject { described_class.new }

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
