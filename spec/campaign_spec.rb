require 'printfection'

module Printfection
  describe Campaign, ".url" do
    it "returns the base resource url" do
      expect(Campaign.url).to eql "/campaigns"
    end
  end

  describe Campaign, "attributes" do
    it "exposes its id" do
      expect(Campaign).to expose_integer :id
    end

    it "exposes its name" do
      expect(Campaign).to expose_string :name
    end

    it "exposes its type" do
      expect(Campaign).to expose_string :type
    end

    it "exposes its created_at" do
      expect(Campaign).to expose_datetime :created_at
    end

    it "exposes its active" do
      expect(Campaign).to expose_boolean :active
    end

    it "exposes its archived" do
      expect(Campaign).to expose_boolean :archived
    end

    it "exposes its url" do
      expect(Campaign).to expose_string :url
    end
  end
end

module Printfection
  describe Campaign, ".retrieve" do
    it "returns the Campaign for the given id" do
      data = double
      campaign = double
      expect(Printfection).to receive(:get).with("/campaigns/123").and_return(data)
      expect(Campaign).to receive(:new).with(data).and_return(campaign)
      expect(Campaign.retrieve(123)).to eql campaign
    end
  end

  describe Campaign, ".all" do
    it "returns an array of Campaigns" do
      data1, data2 = double, double
      campaign1, campaign2 = double, double

      expect(Printfection).to receive(:get).with("/campaigns").and_return([data1, data2])
      expect(Campaign).to receive(:new).with(data1).and_return(campaign1)
      expect(Campaign).to receive(:new).with(data2).and_return(campaign2)

      expect(Campaign.all).to eql [campaign1, campaign2]
    end
  end
end

