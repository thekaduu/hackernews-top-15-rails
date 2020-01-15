# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RelevantComments, type: :model do
  describe '.call' do
    it 'instantes a new instance of the RelevantComments object' do
      expect(described_class).to receive(:new).with('12345') { double(call: []) }
      described_class.call('12345')
    end
  end

  describe '#call' do
    let(:story_id) { '8863' }
    subject { described_class.new(story_id) }

    it 'invokes CommentGateway' do
      expect_any_instance_of(CommentGateway).to receive(:relevant_comments) { [] }
      subject.call
    end

    it 'invokes RelevantCommentsFactory' do
      VCR.use_cassette('success_fetching_relevant_comments') do
        expect(RelevantCommentsFactory).to receive(:call)
        subject.call
      end
    end

    it 'returns an array of comments' do
      VCR.use_cassette('success_fetching_relevant_comments') do
        result = subject.call
        expect(result[0]).to be_kind_of(Comment)
      end
    end
  end
end
