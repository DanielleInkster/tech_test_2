require_relative 'item'
require_relative 'assessment'

class GildedRose

  def initialize(items, assess = ItemAssessor.new)
    @items = items
    @assess = assess
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      @assess.generic_item_check(item) 
      @assess.conjured(item) 
      @assess.aged_brie(item) 
      @assess.concert_pass(item) 
      @assess.sulfuras(item)  
    end
  end
end
