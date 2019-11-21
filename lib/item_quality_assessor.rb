
class ItemQualityAssessor
  SULFURAS_MAX = 80
  GEN_MAX = 50
  GEN_MIN = 0

  def initialize(special_items = ['Aged Brie',
    'Backstage passes to a TAFKAL80ETC concert',
    "Sulfuras, Hand of Ragnaros",
    ])
    @special_items = special_items
  end

  def generic_item_check(item)
    unless not_generic?(item) 
      item.sell_in >= GEN_MIN ? item.quality -= 1 : item.quality -= 2
      item.quality = GEN_MIN if item.quality <= GEN_MIN
    end
  end

  def aged_brie(item)
    if item.name === 'Aged Brie'  
      item.quality += 1 if item.sell_in >= 0
      item.quality += 2 if item.sell_in.between?(-5, -1)  
      item.quality += 3 if item.sell_in < -5
      item.quality = GEN_MAX if item.quality >= GEN_MAX
    end
  end

  def concert_pass(item)
    if item.name === 'Backstage passes to a TAFKAL80ETC concert'
      item.quality += 1 if item.sell_in > 10 
      item.quality += 2 if item.sell_in.between?(6, 10)  
      item.quality += 3 if item.sell_in.between?(1, 5) 
      item.quality = GEN_MIN if item.sell_in === GEN_MIN 
      item.quality = GEN_MAX if item.quality >= GEN_MAX
    end
  end

  def conjured(item)
    if item.name.include?('Conjured')
      item.sell_in >= GEN_MIN ? item.quality -= 2 : item.quality -= 4
    end
  end

  def sulfuras(item)
    if item.name === "Sulfuras, Hand of Ragnaros"
      item.quality = SULFURAS_MAX
      item.sell_in += 1
    end
  end

  def not_generic?(item)
    @special_items.include?(item.name) || item.name.include?('Conjured')
  end
end
