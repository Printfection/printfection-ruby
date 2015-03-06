require 'printfection'

module Printfection
  describe Product, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "id": 123,
          "name": "American Apparel 50/50 T-Shirt"
        }
      JSON
    end

    it "gives access to JSON properties" do
      product = Product.new(json)
      expect(product.id).to eql 123
      expect(product.name).to eql "American Apparel 50/50 T-Shirt"
    end
  end
end

