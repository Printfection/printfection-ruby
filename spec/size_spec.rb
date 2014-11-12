require 'printfection'

module Printfection
  describe Size, "#id" do
    it "returns the size's id" do
      size = Size.new id: 123
      expect(size.id).to eql 123
    end

    it "returns an integer" do
      size = Size.new id: "123"
      expect(size.id).to eql 123
    end
  end

  describe Size, "#name" do
    it "returns the full name of the size" do
      size = Size.new name: "Medium"
      expect(size.name).to eql "Medium"
    end
  end

  describe Size, "#short_name" do
    it "returns the shortened name of the size" do
      size = Size.new short_name: "M"
      expect(size.short_name).to eql "M"
    end
  end

  describe Size, "#stock" do
    it "returns an object that contains information about the size's stock" do
      size = Size.new stock: { available: 498 }
      expect(size.stock.available).to eql 498
    end
  end
end

