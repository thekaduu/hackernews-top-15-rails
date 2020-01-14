# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Story, type: :model do
  it { is_expected.to have_attr_accessor(:by) }
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
    context 'when time is set' do
      subject { described_class.new(time: 1175714200) }

      it { expect(subject.created_at).to eq(DateTime.new(2007, 4, 4, 19, 16, 40)) }
    end

    context 'when time is not set' do
      it { expect(subject.created_at).to be_nil }
    end
  end
end
