# frozen_string_literal: true

class ItemGateway < ApplicationGateway
  def find_all(item_ids)
    [].tap do |items|
      item_ids.each do |item_id|
        response = find(item_id)
        items << response if response.any?
      end
    end
  end

  def find(item_id)
    response = get("item/#{item_id}.json")

    return {} unless response.status == 200

    JSON.parse(response.body)
  end
end
