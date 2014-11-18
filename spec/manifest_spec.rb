require 'printfection'

module Printfection
  describe Manifest, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "lineitems": [],
          "subtotal": 0,
          "coupon": 0,
          "tax": 0,
          "shipping": 0,
          "fulfillment": 0,
          "total": 0,
          "shipments": [],
          "created_at": "2014-09-12T10:22:37Z",
          "received_at": null,
          "approved_at": null,
          "processed_at": null,
          "shipped_at": null,
          "completed_at": null
        }
      JSON
    end

    it "gives access to JSON properties" do
      manifest = Manifest.new(json)
      expect(manifest.subtotal).to eql 0.0
      expect(manifest.coupon).to eql 0.0
      expect(manifest.tax).to eql 0.0
      expect(manifest.shipping).to eql 0.0
      expect(manifest.fulfillment).to eql 0.0
      expect(manifest.total).to eql 0.0
      expect(manifest.created_at).to eql DateTime.parse("2014-09-12T10:22:37Z")
      expect(manifest.received_at).to eql nil
      expect(manifest.approved_at).to eql nil
      expect(manifest.processed_at).to eql nil
      expect(manifest.shipped_at).to eql nil
      expect(manifest.completed_at).to eql nil
    end
  end

  describe Manifest, "#lineitems" do
    it "returns the manifest's lineitems" do
      pending
      fail
    end
  end

  describe Manifest, "#order" do
    it "returns the manifest's shipments" do
      pending
      fail
    end
  end
end

