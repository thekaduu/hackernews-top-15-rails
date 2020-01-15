# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationFactory do
  describe '.call' do
    it 'instantes a new instance of the ApplicationFactory object' do
      expect(described_class).to receive(:new).with([]) { double(call: []) }
      described_class.call([])
    end

    it 'invokes #call' do
      expect_any_instance_of(described_class).to receive(:call)
      described_class.call([])
    end
  end

  describe '#call' do
    subject { described_class.new([{ 'a' => 'b' }]) }

    it 'raises NotImplementedError' do
      expect { subject.call }.to raise_error(NotImplementedError)
    end
  end
end
