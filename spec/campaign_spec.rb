require 'printfection'

module Printfection
  describe Campaign do
    it_behaves_like "Resource"
    include_examples "Actions::Retrieve"
    include_examples "Actions::List"
  end

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

