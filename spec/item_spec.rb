require 'printfection'

module Printfection
  describe Item, ".retrieve" do
    it "returns the Item for the given id" do
      data = double
      item = double
      expect(Printfection).to receive(:get).with("/items/123").and_return(data)
      expect(Item).to receive(:new).with(data).and_return(item)
      expect(Item.retrieve(123)).to eql item
    end
  end

  describe Item, ".list" do
    it "returns an array of Items" do
      data1, data2 = double, double
      item1, item2 = double, double

      expect(Printfection).to receive(:get).with("/items").and_return([data1, data2])
      expect(Item).to receive(:new).with(data1).and_return(item1)
      expect(Item).to receive(:new).with(data2).and_return(item2)

      expect(Item.list).to eql [item1, item2]
    end
  end

  describe Item, "#id" do
    it "returns the item's id" do
      item = Item.new id: 123
      expect(item.id).to eql 123
    end

    it "returns an integer" do
      item = Item.new id: "123"
      expect(item.id).to eql 123
    end
  end

  describe Item, "#name" do
    it "returns the name of the item" do
      item = Item.new name: "My Awesome T-Shirt"
      expect(item.name).to eql "My Awesome T-Shirt"
    end
  end

  describe Item, "#color" do
    it "returns the color of the item" do
      item = Item.new color: "Green"
      expect(item.color).to eql "Green"
    end
  end

  describe Item, "#created_at" do
    it "returns a DateTime for when the item was created" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      item = Item.new created_at: date_str
      expect(item.created_at).to eql parsed_date
    end
  end

  describe Item, "#product" do
    it "returns a Product instance with information about the item's root product" do
      product = double
      product_data = double
      item = Item.new product: product_data
      expect(Product).to receive(:new).
                         with(product_data).
                         and_return(product)
      expect(item.product).to eql product
    end
  end

  describe Item, "#sizes" do
    it "returns an array of the item's sizes" do
      pending
      fail
    end
  end

  describe Item, "#images" do
    it "returns an array of the item's images" do
      pending
      fail
    end
  end

  describe Item, "#campaigns" do
    it "returns an array of the item's campaigns" do
      pending
      fail
    end
  end
end

