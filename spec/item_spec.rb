require 'printfection'

module Printfection
  describe Item, "#id" do
    it "returns the item's id" do
      item = Item.new id: 1
      expect(item.id).to eql 1
    end

    it "returns an integer" do
      item = Item.new id: "1"
      expect(item.id).to eql 1
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
    it "returns an object with information about the item's root product" do
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

