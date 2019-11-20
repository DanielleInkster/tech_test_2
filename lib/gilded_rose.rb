require_relative 'item'

class GildedRose
  SULFURAS_MAX = 80
  GEN_MAX = 50
  GEN_MIN = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      if item.name === 'Aged Brie'
        aged_brie(item)
      elsif item.name === 'Backstage passes to a TAFKAL80ETC concert'
        concert_pass(item)
      elsif item.name === "Sulfuras, Hand of Ragnaros" 
        sulfuras(item)
      else
        quality_check(item)
      end
    end
  end

  private

  def quality_check(item)
    item.sell_in >= 0 ? item.quality -= 1 : item.quality -= 2
    item.quality = GEN_MIN if item.quality <= GEN_MIN
  end

  def aged_brie(item)
    item.quality += 1 if item.sell_in >= 0
    item.quality += 2 if item.sell_in.between?(-5, -1)  
    item.quality += 3 if item.sell_in < -5
    item.quality = GEN_MAX if item.quality >= GEN_MAX
  end

  def concert_pass(item)
    item.quality = 0 if item.sell_in === 0 
    item.quality += 1 if item.sell_in > 10 
    item.quality += 2 if item.sell_in.between?(6, 10)  
    item.quality += 3 if item.sell_in.between?(1, 5) 
    item.quality = GEN_MAX if item.quality >= GEN_MAX
  end

  def sulfuras(item)
    item.quality = SULFURAS_MAX
    item.sell_in += 1
  end
end
