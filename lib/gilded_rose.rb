require_relative 'item'

class GildedRose

  MINIMUM_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      if item.quality ===  MINIMUM_QUALITY
        MINIMUM_QUALITY
      else
      item.quality -= 1
      end
    end
  end

end
