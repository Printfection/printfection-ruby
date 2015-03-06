require 'printfection'

module Printfection
  describe Asset, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "id": 1,
          "object": "asset",
          "name": "front",
          "assets": {
            "design": "https://assets.printfection.com/xe90asdf.jpg",
            "overlay": "https://assets.printfection.com/xe90asdf.jpg"
          }
        }
      JSON
    end

    it "gives access to JSON properties" do
      asset = Asset.new(json)
      expect(asset.id).to eql 1
      expect(asset.name).to eql "front"
      expect(asset.assets.design).to eql "https://assets.printfection.com/xe90asdf.jpg"
      expect(asset.assets.overlay).to eql "https://assets.printfection.com/xe90asdf.jpg"
    end
  end
end

