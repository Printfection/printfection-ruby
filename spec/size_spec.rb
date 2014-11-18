require 'printfection'

module Printfection
  describe Size, "attributes" do
    it "exposes its id" do
      expect(Size).to expose_integer :id
    end

    it "exposes its name" do
      expect(Size).to expose_string :name
    end

    it "exposes its short_name" do
      expect(Size).to expose_string :short_name
    end
  end
end

module Printfection
  describe Size, "#stock" do
    it "returns an object that contains information about the size's stock" do
      size = Size.new stock: { available: 498 }
      expect(size.stock.available).to eql 498
    end
  end
end

