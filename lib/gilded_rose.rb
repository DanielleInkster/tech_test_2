require_relative 'item'

class GildedRose
  SULFURAS_MAX = 80
  GEN_MAX = 50
  GEN_MIN = 0

  def initialize(items)
    @items = items
    @arr = ['Aged Brie',
      'Backstage passes to a TAFKAL80ETC concert',
      "Sulfuras, Hand of Ragnaros"]
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      quality_check(item) unless @arr.include?(item.name)
      aged_brie(item) if item.name === 'Aged Brie'  
      concert_pass(item) if item.name === 'Backstage passes to a TAFKAL80ETC concert'
      sulfuras(item) if item.name === "Sulfuras, Hand of Ragnaros" 
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
