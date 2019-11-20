require 'assessment'

describe ItemAssessor do

  describe '#generic_item_check' do
    it 'subtracts one from the quality count if sell_in is positive' do
      item = Item.new("foo", 1, 1)
      GildedRose.new(item).assess.generic_item_check(item)
      expect(item.quality).to eq 0
    end

    it 'subtracts two from the quality count if sell_in is negative' do
      item = Item.new("foo", 0, 2)
      item.sell_in -= 1
      GildedRose.new(item).assess.generic_item_check(item)
      expect(item.quality).to eq 0
    end

    it 'does not allow quality below 0' do
      item = Item.new("foo", 0, 0)
      GildedRose.new(item).assess.generic_item_check(item)
      expect(item.quality).to eq 0
    end
  end

  describe '#conjured' do
    it 'subtracts two from the quality count if the item is conjured' do
      item = Item.new("Conjured foo", 4, 4)
      GildedRose.new(item).assess.conjured(item)
      expect(item.quality).to eq 2
    end

    it 'subtracts 4 from the quality count if the conjured item has negative sell_in' do
      item = Item.new("Conjured foo", 0, 4)
      item.sell_in -= 1
      GildedRose.new(item).assess.conjured(item)
      expect(item.quality).to eq 0
    end
  end

  describe '#sulfaras' do
    it 'leaves the quality and date of Sulfaras unchanged' do
      item = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
      item.sell_in -= 1
      GildedRose.new(item).assess.sulfuras(item)
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 80
    end
  end

  describe '#concert_pass' do
    it 'increases by 1 in quality when sell_in is > 10' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 40)
      item.sell_in -= 1
      GildedRose.new(item).assess.concert_pass(item)
      expect(item.quality).to eq 41
    end

    it 'increases by 2 in quality when sell_in is between 6, 10' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 40)
      item.sell_in -= 1
      GildedRose.new(item).assess.concert_pass(item)
      expect(item.quality).to eq 42
    end

    it 'increases by 3 in quality when sell_in is between 1, 5' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 40)
      item.sell_in -= 1
      GildedRose.new(item).assess.concert_pass(item)
      expect(item.quality).to eq 43
    end

    it 'changes quality to 0 when sell_in is 0' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 40)
      item.sell_in -= 1
      GildedRose.new(item).assess.concert_pass(item)
      expect(item.quality).to eq 0
    end

    it 'does not exceed a quality of 50 ' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 50)
      item.sell_in -= 1
      GildedRose.new(item).assess.concert_pass(item)
      expect(item.quality).to eq 50
    end
  end

  describe 'aged_brie' do
    it 'allows aged brie to increase in quality' do
      item = Item.new("Aged Brie", 1, 0)
      item.sell_in -= 1
      GildedRose.new(item).assess.aged_brie(item)
      expect(item.quality).to eq 1
    end

    it 'allows aged brie to increase +2 in quality when sell_in is between -1,-5' do
      item = Item.new("Aged Brie", 0, 0)
      item.sell_in -= 1
      GildedRose.new(item).assess.aged_brie(item)
      expect(item.quality).to eq 2
    end

    it 'allows aged brie to increase +3 in quality when sell_in is below -5' do
      item = Item.new("Aged Brie", -5, 0)
      item.sell_in -= 1
      GildedRose.new(item).assess.aged_brie(item)
      expect(item.quality).to eq 3
    end

    it 'does not allow aged brie quality to exceed 50' do
      item = Item.new("Aged Brie", 0, 50)
      item.sell_in -= 1
      GildedRose.new(item).assess.aged_brie(item)
      expect(item.quality).to eq 50
    end
  end
end
