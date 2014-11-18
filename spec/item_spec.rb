require 'printfection'

module Printfection
  describe Item do
    it_behaves_like "Resource"
    include_examples "Actions::Retrieve"
    include_examples "Actions::List"
  end

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

