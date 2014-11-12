require 'printfection'

module Printfection
  describe Image, "#id" do
    it "returns the image's id" do
      image = Image.new id: 123
      expect(image.id).to eql 123
    end

    it "returns an integer" do
      image = Image.new id: "123"
      expect(image.id).to eql 123
    end
  end

  describe Image, "#name" do
    it "returns the name of the image" do
      image = Image.new name: "front"
      expect(image.name).to eql "front"
    end
  end

  describe Image, "#assets" do
    it "returns an object that contains information about the image's assets" do
      image = Image.new assets: { product: "https://images.printfection.com/ae90asdf.jpg",
                                  design:  "https://images.printfection.com/be90asdf.jpg",
                                  overlay: "https://images.printfection.com/ce90asdf.jpg" }
      expect(image.assets.product).to eql "https://images.printfection.com/ae90asdf.jpg"
      expect(image.assets.design).to  eql "https://images.printfection.com/be90asdf.jpg"
      expect(image.assets.overlay).to eql "https://images.printfection.com/ce90asdf.jpg"
    end
  end
end

