# frozen_string_literal: true

class ApplicationFactory
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def self.call(data)
    new(data).call
  end

  def call
    raise NotImplementedError
  end
end
