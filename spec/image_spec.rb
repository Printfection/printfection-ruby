require 'printfection'

module Printfection
  describe Image, "attributes" do
    it "exposes its id" do
      expect(Image).to expose_integer :id
    end

    it "exposes its name" do
      expect(Image).to expose_string :name
    end
  end
end

module Printfection
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

