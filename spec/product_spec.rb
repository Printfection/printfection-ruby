require 'printfection'

module Printfection
  describe Product, "attributes" do
    it "exposes its id" do
      expect(Product).to expose_integer :id
    end

    it "exposes its name" do
      expect(Product).to expose_string :name
    end
  end
end

