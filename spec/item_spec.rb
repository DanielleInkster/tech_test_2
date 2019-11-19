require 'item'

describe Item do
    it "initializes with a name" do
      item = Item.new("foo", 0, 0)
      expect(item.name).to eq("foo")
    end
end