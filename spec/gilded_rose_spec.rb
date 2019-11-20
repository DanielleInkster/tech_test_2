require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it 'subtracts one from the sell_in day'do
      items = [Item.new("foo", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end

    it 'subtracts one from the quality count if sell_in is positive'do
      items = [Item.new("foo", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it 'subtracts two from the quality count if sell_in is negative'do
      items = [Item.new("foo", 0, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq -1
    end

    it 'does not allow quality below 0' do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it 'does not change the quality of Sulfuras' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end

    it 'allows aged brie to increase in quality' do
      items = [Item.new("Aged Brie", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it 'allows aged brie to increase +2 in quality when sell_in is between -1,-5' do
      items = [Item.new("Aged Brie", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end

    it 'allows aged brie to increase +3 in quality when sell_in is below -5' do
      items = [Item.new("Aged Brie", -5, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 3
    end


    # save for brie/tickets tests
    # it 'does not allow quality above 50' do
    #   items = [Item.new("foo", 0, 52)]
    #   GildedRose.new(items).update_quality()
    #   expect(items[0].quality).to eq 50
    # end

  end

end
