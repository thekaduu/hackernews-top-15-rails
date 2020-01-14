# frozen_string_literal: true

class Story
  include ActiveModel::Model

  attr_accessor :id, :by, :kids, :score, :text, :time, :title,
                :type, :url, :descendants
end
