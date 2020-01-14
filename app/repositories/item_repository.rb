# frozen_string_literal: true

class ItemRepository < ApplicationRepository
  def find_all(item_ids)
    [].tap do |items|
      item_ids.each do |item_id|
        response = get("item/#{item_id}.json")
        if response.status == 200
          items << JSON.parse(response.body)
        end
      end
    end
  end
end
