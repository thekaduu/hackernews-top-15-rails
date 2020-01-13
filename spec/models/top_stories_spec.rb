# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopStories, type: :model do
  describe '.call' do
    it 'instantes a new instance of the TopStories object' do
      expect(described_class).to receive(:new).with('query') { double(call: []) }
      described_class.call('query')
    end
  end
end
