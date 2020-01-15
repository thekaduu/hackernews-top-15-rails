class Item
  include ActiveModel::Model

  attr_accessor :id, :by, :kids, :score, :text, :time, :title,
                :type, :url, :descendants, :dead

  def created_at
    DateTime.strptime(time.to_s, "%s") if time
  end
end
