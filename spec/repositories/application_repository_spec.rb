# frozen_string_literal: true

require 'rails_helper'

describe ApplicationRepository do
  it { expect(described_class::BASE_URI).to eq('https://hacker-news.firebaseio.com/v0') }

  describe '#get' do
    subject { described_class.new }

    it 'invokes Faraday.get' do
      expect(Faraday).to receive(:get).with("#{described_class::BASE_URI}/my-path", {}, {})
      subject.get('my-path')
    end
  end
end
