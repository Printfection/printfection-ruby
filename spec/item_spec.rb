require 'printfection'

module Printfection
  describe Item, ".url" do
    it "returns the base resource url" do
      expect(Item.url).to eql "/items"
    end
  end

  describe Item, "attributes" do
    it "exposes its id" do
      expect(Item).to expose_integer :id
    end

    it "exposes its name" do
      expect(Item).to expose_string :name
    end

    it "exposes its color" do
      expect(Item).to expose_string :color
    end

    it "exposes its created_at" do
      expect(Item).to expose_datetime :created_at
    end
  end
end

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

  describe Item, ".all" do
    it "returns an array of Items" do
      data1, data2 = double, double
      item1, item2 = double, double

      expect(Printfection).to receive(:get).with("/items").and_return([data1, data2])
      expect(Item).to receive(:new).with(data1).and_return(item1)
      expect(Item).to receive(:new).with(data2).and_return(item2)

      expect(Item.all).to eql [item1, item2]
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

