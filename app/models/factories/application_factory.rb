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
    [].tap do |collection|
      data.each { |attr| collection << blueprint.new(attr) }
    end
  end

  private

  def blueprint
    raise NotImplementedError
  end
end
