require 'printfection'

module Printfection
  describe Image, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "id": 1,
          "object": "image",
          "name": "front",
          "assets": {
            "design": "https://images.printfection.com/xe90asdf.jpg",
            "overlay": "https://images.printfection.com/xe90asdf.jpg"
          }
        }
      JSON
    end

    it "gives access to JSON properties" do
      image = Image.new(json)
      expect(image.id).to eql 1
      expect(image.name).to eql "front"
      expect(image.assets.design).to eql "https://images.printfection.com/xe90asdf.jpg"
      expect(image.assets.overlay).to eql "https://images.printfection.com/xe90asdf.jpg"
    end
  end
end

