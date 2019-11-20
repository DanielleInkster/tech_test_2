require_relative 'item'

class GildedRose

  # MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      quality_check(item)
    end
  end


  private
  def quality_check(item)
    if item.quality ===  MINIMUM_QUALITY
      MINIMUM_QUALITY
    else
    item.quality -= 1
    end
  end
end
