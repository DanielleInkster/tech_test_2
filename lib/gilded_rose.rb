require_relative 'item'

class GildedRose
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      if item.name === 'Aged Brie'
        aged_brie(item)
      else
        quality_check(item)
      end
    end
  end


  private

  def quality_check(item)
    if item.name === "Sulfuras, Hand of Ragnaros" || item.quality ===  MINIMUM_QUALITY
      item.quality
    else
      if item.sell_in >= 0
        item.quality -= 1
      else
        item.quality -=2
      end
    end
  end

  def aged_brie(item)
    if item.quality < MAXIMUM_QUALITY
      if item.sell_in.between?(-5,-1)
        item.quality +=2
      elsif item.sell_in < -5
        item.quality +=3
      else
        item.quality +=1
      end
    else 
      item.quality
    end
  end

end
