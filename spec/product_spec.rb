require 'printfection'

module Printfection
  describe Product, "#id" do
    it "returns the product's id" do
      product = Product.new id: 123
      expect(product.id).to eql 123
    end

    it "returns an integer" do
      product = Product.new id: "123"
      expect(product.id).to eql 123
    end
  end

  describe Product, "#name" do
    it "returns the name of the product" do
      product = Product.new name: "American Apparel 50/50 T-Shirt"
      expect(product.name).to eql "American Apparel 50/50 T-Shirt"
    end
  end
end

