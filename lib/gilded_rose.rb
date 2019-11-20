require_relative 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      item.quality -= 1
    end
  end

end
