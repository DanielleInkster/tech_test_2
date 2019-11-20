require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it 'subtracts one from the sell_in day'do
    items = [Item.new("foo", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end

    it 'subtracts one from the quality count'do
    items = [Item.new("foo", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end



    # it "does not allow quality to fall below 0" do
    #   items = [Item.new("foo", 0, 0)]
    #   GildedRose.new(items).update_quality()
    #   expect(items[0].quality).to eq 0


  end

end
