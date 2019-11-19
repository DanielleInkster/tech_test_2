require 'item'

describe Item do
  subject(:item) { described_class.new("foo", 0, 0) }

  it "initializes with a name" do
    expect(item.name).to eq("foo")
  end

  it "initializes with a sell_in integer" do
    expect(item.sell_in).to eq(0)
  end

  it "initializes with a quality integer" do
    expect(item.quality).to eq(0)
  end

  describe '#print' do
    it "prints the properties of the item" do
      expect(item.print).to eq("foo, 0, 0")
    end
  end
end
