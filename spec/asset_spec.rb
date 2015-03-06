require 'printfection'

module Printfection
  describe Asset, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "id": 1,
          "object": "asset",
          "type": "display",
          "name": "AA-WhiteLogo-Front.png",
          "perspective": "front",
          "url": "https://img.printfection.com/18/26/234234lkajsdfdsf7/AA-WhiteLogo-Front.png",
          "notes": ""
        }
      JSON
    end

    it "gives access to JSON properties" do
      asset = Asset.new(json)
      expect(asset.id).to eql 1
      expect(asset.type).to eql "display"
      expect(asset.name).to eql "AA-WhiteLogo-Front.png"
      expect(asset.perspective).to eql "front"
      expect(asset.url).to eql "https://img.printfection.com/18/26/234234lkajsdfdsf7/AA-WhiteLogo-Front.png"
      expect(asset.notes).to eql ""
    end
  end
end

