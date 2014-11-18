require 'printfection'

module Printfection
  describe Size, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "id": 1,
          "object": "size",
          "name": "Medium",
          "short_name": "M",
          "stock": {
            "available": 498
          }
        }
      JSON
    end

    it "gives access to JSON properties" do
      size = Size.new(json)
      expect(size.id).to eql 1
      expect(size.name).to eql "Medium"
      expect(size.short_name).to eql "M"
      expect(size.stock.available).to eql 498
    end
  end
end

module Printfection
  describe Size, "#stock" do
    it "returns an object that contains information about the size's stock" do
      pending
      fail
      size = Size.new stock: { available: 498 }
      expect(size.stock.available).to eql 498
    end
  end
end

