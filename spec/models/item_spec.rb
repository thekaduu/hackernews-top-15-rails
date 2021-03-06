# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to have_attr_accessor(:by) }
  it { is_expected.to have_attr_accessor(:dead) }
  it { is_expected.to have_attr_accessor(:descendants) }
  it { is_expected.to have_attr_accessor(:id) }
  it { is_expected.to have_attr_accessor(:kids) }
  it { is_expected.to have_attr_accessor(:score) }
  it { is_expected.to have_attr_accessor(:text) }
  it { is_expected.to have_attr_accessor(:time) }
  it { is_expected.to have_attr_accessor(:title) }
  it { is_expected.to have_attr_accessor(:type) }
  it { is_expected.to have_attr_accessor(:url) }

  describe '#created_at' do
    subject { described_class.new(time: time) }

    context 'when time is not defined' do
      let(:time) { nil }

      it { expect(subject.time).to be_nil }
    end

    context 'when time is defined' do
      let(:time) { 1579132535 }

      it { expect(subject.created_at).to be_kind_of(DateTime) }
    end
  end
end
