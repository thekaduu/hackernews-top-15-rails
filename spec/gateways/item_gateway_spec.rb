# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemGateway, type: :model do
  let(:item_ids) { [9129911, 9129199, 9127761, 9128141] }

  describe '#find_all' do
    subject { described_class.new }

    it 'fetch data for each ID' do
      VCR.use_cassette('success_fetching_items') do
        expect(subject).to receive(:get).exactly(4).times.and_call_original
        subject.find_all(item_ids)
      end
    end

    it 'fetches data from list of IDs' do
      VCR.use_cassette('success_fetching_items') do
        result = subject.find_all(item_ids)

        expect(result).to be_kind_of(Array)
        expect(result[0]).to eq({
          'by' => 'theyeti', 'descendants' => 16, 'id' => 9129911,
          'kids' => [9129990, 9130206, 9130376, 9130273, 9131289, 9131728, 9137773, 9132476],
          'score' => 78, 'text' => '', 'time' => 1425261906,
          'title' => 'Venture Capital in the 1980s', 'type' => 'story',
          'url' => 'http://reactionwheel.net/2015/01/80s-vc.html'
        })
      end
    end
  end
end
