require 'printfection'

module Printfection
  describe Campaign, "#id" do
    it "returns the campaign's id" do
      campaign = Campaign.new id: 123
      expect(campaign.id).to eql 123
    end

    it "returns an integer" do
      campaign = Campaign.new id: "123"
      expect(campaign.id).to eql 123
    end
  end

  describe Campaign, "#name" do
    it "returns the name of the campaign" do
      campaign = Campaign.new name: "My Awesome Giveaway Campaign"
      expect(campaign.name).to eql "My Awesome Giveaway Campaign"
    end
  end

  describe Campaign, "#type" do
    it "returns the type of the campaign" do
      campaign = Campaign.new type: "giveaway"
      expect(campaign.type).to eql "giveaway"
    end
  end

  describe Campaign, "#active?" do
    it "returns true when the campaign is active" do
      campaign = Campaign.new active: true
      expect(campaign.active?).to eql true
    end

    it "returns false when the campaign is not active" do
      campaign = Campaign.new active: false
      expect(campaign.active?).to eql false
    end
  end

  describe Campaign, "#archived?" do
    it "returns true when the campaign is archived" do
      campaign = Campaign.new archived: true
      expect(campaign.archived?).to eql true
    end

    it "returns false when the campaign is not archived" do
      campaign = Campaign.new archived: false
      expect(campaign.archived?).to eql false
    end
  end

  describe Campaign, "#url" do
    it "returns the web URL for the campaign" do
      campaign = Campaign.new url: "https://printfection.com/campaign/123"
      expect(campaign.url).to eql "https://printfection.com/campaign/123"
    end
  end

  describe Campaign, "#created_at" do
    it "returns a DateTime for when the campaign was created" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      campaign = Campaign.new created_at: date_str
      expect(campaign.created_at).to eql parsed_date
    end
  end
end
