require 'printfection'

module Printfection
  describe Campaign do
    it_behaves_like "Resource"
    include_examples "Actions::Retrieve"
    include_examples "Actions::List"
  end

  describe Campaign, ".uri" do
    it "returns the base resource uri" do
      expect(Campaign.uri).to eql "/campaigns"
    end
  end

  describe Campaign, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "id": 1,
          "object": "campaign",
          "type": "giveaway",
          "name": "My Awesome Giveaway Campaign",
          "active": true,
          "archived": false,
          "url": "https://get.printfection.com/i8kbn/6651657281",
          "created_at": "2014-09-12T10:22:37Z"
        }
      JSON
    end

    it "gives access to JSON properties" do
      campaign = Campaign.new(json)
      expect(campaign.id).to eql 1
      expect(campaign.type).to eql "giveaway"
      expect(campaign.name).to eql "My Awesome Giveaway Campaign"
      expect(campaign.active).to eql true
      expect(campaign.archived).to eql false
      expect(campaign.url).to eql "https://get.printfection.com/i8kbn/6651657281"
      expect(campaign.created_at).to eql DateTime.parse("2014-09-12T10:22:37Z")
    end
  end
end

