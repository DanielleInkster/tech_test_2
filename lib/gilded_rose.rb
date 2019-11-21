require_relative 'item'
require_relative 'item_assessor'

class GildedRose

  attr_accessor :assess

  def initialize(items, assess = ItemQualityAssessor.new)
    @items = items
    @assess = assess
  end

  def update_quality
    @items.each do |item|
      update_date(item)
      @assess.generic_item_check(item) 
      @assess.conjured(item) 
      @assess.aged_brie(item) 
      @assess.concert_pass(item) 
      @assess.sulfuras(item)  
    end
  end

  private
  def update_date(item)
    item.sell_in -= 1
  end
end
