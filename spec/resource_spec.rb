require 'printfection'

module Printfection
  describe Resource, "#changes" do
    it "returns a hash of the changed properties" do
      klass = Class.new(Resource) do
        property :size
        property :color
        property :price
      end
      resource = klass.new(size: "Large", color: "Blue", price: 123.45)
      resource.price = 678.90
      expect(resource.changes).to eql({"price" => 678.90})
      resource.size = "Medium"
      expect(resource.changes).to eql({"size" => "Medium", "price" => 678.90})
      resource.price = 123.45
      expect(resource.changes).to eql({"size" => "Medium"})
    end
  end
end

