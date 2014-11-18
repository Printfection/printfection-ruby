require 'printfection'

module Printfection
  describe Item do
    it_behaves_like "Resource"
    include_examples "Actions::Retrieve"
    include_examples "Actions::List"
  end

  describe Item, ".url" do
    it "returns the base resource url" do
      expect(Item.url).to eql "/items"
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
          "campaigns": [],
          "sizes": [],
          "images": []
        }
      JSON
    end

    it "gives access to JSON properties" do
      item = Item.new(json)
      expect(item.id).to eql 1
      expect(item.name).to eql "My Awesome T-Shirt"
      expect(item.color).to eql "Green"
      expect(item.created_at).to eql DateTime.parse("2014-09-12T10:22:37Z")
    end
  end

  describe Item, "#product" do
    it "returns a Product instance with information about the item's root product" do
      pending
      fail
    end
  end

  describe Item, "#sizes" do
    it "returns an array of the item's sizes" do
      pending
      fail
    end
  end

  describe Item, "#images" do
    it "returns an array of the item's images" do
      pending
      fail
    end
  end

  describe Item, "#campaigns" do
    it "returns an array of the item's campaigns" do
      pending
      fail
    end
  end
end

