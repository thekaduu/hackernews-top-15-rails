# frozen_string_literal: true

class ApplicationRepository
  BASE_URI = 'https://hacker-news.firebaseio.com/v0'

  attr_reader :client

  def initialize
    @client = Faraday
  end

  def get(path, params = {}, headers = {})
    client.get("#{BASE_URI}/#{path}", params, headers)
  end
end
