require_relative 'item'

class GildedRose
  # MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
        quality_check(item)
      item.sell_in -= 1
    end
  end


  private

  def quality_check(item)
    if item.name === "Sulfuras, Hand of Ragnaros" || item.quality ===  MINIMUM_QUALITY
      item.quality +=0
    else
      item.quality -= 1
    end
  end

end
