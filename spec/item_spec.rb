require 'printfection'

module Printfection
  describe Item do
    it_behaves_like "Resource"
    include_examples "Actions::Retrieve"
    include_examples "Actions::List"
  end

  describe Item, ".uri" do
    it "returns the base resource uri" do
      expect(Item.uri).to eql "/items"
    end
  end

  describe Item, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "id": 1,
          "object": "item",
          "name": "My Awesome T-Shirt",
          "color": "Green",
          "product": {
            "id": 123,
            "name": "American Apparel 50/50 T-Shirt"
          },
          "created_at": "2014-09-12T10:22:37Z",
          "campaigns": [
            {
              "id": 1,
              "object": "campaign",
              "type": "giveaway",
              "name": "My Awesome Giveaway Campaign",
              "active": true,
              "archived": false,
              "url": "https://get.printfection.com/i8kbn/6651657281",
              "created_at": "2014-09-12T10:22:37Z"
            },
            {
              "id": 2,
              "object": "campaign",
              "type": "giveaway",
              "name": "My Other Giveaway Campaign",
              "active": false,
              "archived": true,
              "url": "https://get.printfection.com/i8kbn/6651657282",
              "created_at": "2014-09-11T10:22:37Z"
            }
          ],
          "sizes": [
            {
              "id": 1,
              "object": "size",
              "name": "Medium",
              "short_name": "M",
              "stock": {
                "available": 498
              }
            },
            {
              "id": 2,
              "object": "size",
              "name": "Large",
              "short_name": "L",
              "stock": {
                "available": 996
              }
            }
          ],
          "images": [
            {
              "id": 1,
              "object": "image",
              "name": "front",
              "assets": {
                "design": "https://images.printfection.com/xe90asdf.jpg",
                "overlay": "https://images.printfection.com/xe90asdf.jpg"
              }
            },
            {
              "id": 1,
              "object": "image",
              "name": "front",
              "assets": {
                "design": "https://images.printfection.com/xe90asdf.jpg",
                "overlay": "https://images.printfection.com/xe90asdf.jpg"
              }
            }
          ]
        }
      JSON
    end

    it "gives access to JSON properties" do
      item = Item.new(json)
      expect(item.id).to eql 1
      expect(item.name).to eql "My Awesome T-Shirt"
      expect(item.color).to eql "Green"
      expect(item.created_at).to eql DateTime.parse("2014-09-12T10:22:37Z")

      expect(item.product).to be_a Product

      expect(item.campaigns).to be_an Array
      expect(item.campaigns.count).to eql 2
      expect(item.campaigns.first).to be_a Campaign

      expect(item.sizes).to be_an Array
      expect(item.sizes.count).to eql 2
      expect(item.sizes.first).to be_a Size

      expect(item.images).to be_an Array
      expect(item.images.count).to eql 2
      expect(item.images.first).to be_a Image
    end
  end
end

