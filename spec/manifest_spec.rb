require 'printfection'

module Printfection
  describe Manifest, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "subtotal": 0,
          "coupon": 0,
          "tax": 0,
          "shipping": 0,
          "fulfillment": 0,
          "total": 0,
          "created_at": "2014-09-12T10:22:37Z",
          "received_at": null,
          "approved_at": null,
          "processed_at": null,
          "shipped_at": null,
          "completed_at": null,
          "lineitems": [
            {
              "id": 1,
              "object": "lineitem",
              "order_id": 1,
              "item_id": 2,
              "size_id": 3,
              "quantity": 4,
              "created_at": "2014-09-12T10:22:37Z"
            },
            {
              "id": 2,
              "object": "lineitem",
              "order_id": 1,
              "item_id": 2,
              "size_id": 3,
              "quantity": 4,
              "created_at": "2014-09-12T10:22:37Z"
            }
          ],
          "shipments": [
            {
              "carrier": "UPS",
              "method": "Ground",
              "tracking_number": "12345678",
              "created_at": "2014-09-12T10:22:37Z"
            },
            {
              "carrier": "FedEx",
              "method": "2DA",
              "tracking_number": "90123456",
              "created_at": "2014-09-12T10:22:37Z"
            }
          ]
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

      expect(manifest.line_items).to be_an Array
      expect(manifest.line_items.count).to eql 2
      expect(manifest.line_items.first).to be_a LineItem

      expect(manifest.shipments).to be_an Array
      expect(manifest.shipments.count).to eql 2
      expect(manifest.shipments.first).to be_a Hashie::Mash
    end
  end
end

