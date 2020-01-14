# frozen_string_literal: true

class StoriesFactory < ApplicationFactory
  def call
    [].tap do |stories|
      data.each do |attributes|
        stories << Story.new(attributes)
      end
    end
  end
end
