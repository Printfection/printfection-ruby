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

      expect(size.stock).to be_a Hashie::Mash
      expect(size.stock.available).to eql 498
    end
  end
end

