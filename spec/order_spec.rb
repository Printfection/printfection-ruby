require 'printfection'

module Printfection
  describe Order do
    it_behaves_like "Resource"
    include_examples "Actions::Retrieve"
    include_examples "Actions::List"
    include_examples "Actions::Create"
    include_examples "Actions::Update"
    include_examples "Actions::Delete"
  end

  describe Order, ".url" do
    it "returns the base resource url" do
      expect(Order.url).to eql "/orders"
    end
  end

  describe Order, "properties" do
    let(:json) do
      JSON.parse <<-JSON
        {
          "id": 1,
          "object": "order",
          "campaign_id": 2,
          "status": "open",
          "code": "nhou890o",
          "url": "https://printfection.com/nhou890o",
          "gift": false,
          "gift_message": "",
          "created_at": "2014-09-12T10:22:37Z",
          "ship_to": {
             "name": "Joseph Schmo",
             "address": "123 Main Street",
             "address2": "Suite 101",
             "company": "ACME Inc.",
             "city": "Denver",
             "state": "Colorado",
             "zip": "80202",
             "country": "United States"
          },
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
          "manifest": {
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
        }
      JSON
    end

    it "gives access to JSON properties" do
      order = Order.new(json)
      expect(order.id).to eql 1
      expect(order.campaign_id).to eql 2
      expect(order.created_at).to eql DateTime.parse("2014-09-12T10:22:37Z")
      expect(order.code).to eql "nhou890o"
      expect(order.url).to eql "https://printfection.com/nhou890o"
      expect(order.gift).to eql false
      expect(order.gift_message).to eql ""

      expect(order.ship_to).to be_an Address
      expect(order.manifest).to be_a Manifest

      expect(order.line_items).to be_an Array
      expect(order.line_items.count).to eql 2
      expect(order.line_items.first).to be_a LineItem
    end
  end

  describe Order, "#place" do
    it "performs a post to place the order" do
      order = Order.new(:id => 123)
      expect(Printfection).to receive(:post).
                              with("/orders/123/place")
      order.place
    end
  end

  describe Order, "#cancel" do
    it "deletes the order" do
      order = Order.new(:id => 123)
      expect(order).to receive(:delete)
      order.cancel
    end
  end

  describe Order, "#campaign" do
    it "returns the order's Campaign" do
      campaign = double
      allow(Campaign).to receive(:retrieve).
                         with(123).
                         and_return(campaign)
      order = Order.new(campaign_id: 123)
      expect(order.campaign).to eql campaign
    end
  end

  describe Order, "#open?" do
    it "returns true when the order's status is 'open'" do
      order = Order.new status: "open"
      expect(order.open?).to eql true
    end

    it "returns false when the order's status is not 'open'" do
      order = Order.new status: "cancelled"
      expect(order.open?).to eql false
    end
  end

  describe Order, "#cancelled?" do
    it "returns true when the order's status is 'cancelled'" do
      order = Order.new status: "cancelled"
      expect(order.cancelled?).to eql true
    end

    it "returns false when the order's status is not 'cancelled'" do
      order = Order.new status: "open"
      expect(order.cancelled?).to eql false
    end
  end

  describe Order, "#received?" do
    it "returns true when the order's status is 'received'" do
      order = Order.new status: "received"
      expect(order.received?).to eql true
    end

    it "returns true when the order's status is 'approved'" do
      order = Order.new status: "approved"
      expect(order.received?).to eql true
    end

    it "returns true when the order's status is 'processed'" do
      order = Order.new status: "processed"
      expect(order.received?).to eql true
    end

    it "returns true when the order's status is 'shipped'" do
      order = Order.new status: "shipped"
      expect(order.received?).to eql true
    end

    it "returns true when the order's status is 'completed'" do
      order = Order.new status: "completed"
      expect(order.received?).to eql true
    end
  end

  describe Order, "#approved?" do
    it "returns true when the order's status is 'approved'" do
      order = Order.new status: "approved"
      expect(order.approved?).to eql true
    end

    it "returns true when the order's status is 'processed'" do
      order = Order.new status: "processed"
      expect(order.approved?).to eql true
    end

    it "returns true when the order's status is 'shipped'" do
      order = Order.new status: "shipped"
      expect(order.approved?).to eql true
    end

    it "returns true when the order's status is 'completed'" do
      order = Order.new status: "completed"
      expect(order.approved?).to eql true
    end
  end

  describe Order, "#processed?" do
    it "returns true when the order's status is 'processed'" do
      order = Order.new status: "processed"
      expect(order.processed?).to eql true
    end

    it "returns true when the order's status is 'shipped'" do
      order = Order.new status: "shipped"
      expect(order.processed?).to eql true
    end

    it "returns true when the order's status is 'completed'" do
      order = Order.new status: "completed"
      expect(order.processed?).to eql true
    end
  end

  describe Order, "#shipped?" do
    it "returns true when the order's status is 'shipped'" do
      order = Order.new status: "shipped"
      expect(order.shipped?).to eql true
    end

    it "returns true when the order's status is 'completed'" do
      order = Order.new status: "completed"
      expect(order.shipped?).to eql true
    end
  end

  describe Order, "#completed?" do
    it "returns true when the order's status is 'completed'" do
      order = Order.new status: "completed"
      expect(order.completed?).to eql true
    end

    it "returns false when the order's status is not 'completed'" do
      order = Order.new status: "open"
      expect(order.completed?).to eql false
    end
  end
end

