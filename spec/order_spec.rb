require 'printfection'

module Printfection
  describe Order, ".retrieve" do
    it "returns the Order for the given id" do
      data = double
      order = double
      expect(Printfection).to receive(:get).with("/orders/123").and_return(data)
      expect(Order).to receive(:new).with(data).and_return(order)
      expect(Order.retrieve(123)).to eql order
    end
  end

  describe Order, ".list" do
    it "returns an array of Orders" do
      data1, data2 = double, double
      order1, order2 = double, double

      expect(Printfection).to receive(:get).with("/orders").and_return([data1, data2])
      expect(Order).to receive(:new).with(data1).and_return(order1)
      expect(Order).to receive(:new).with(data2).and_return(order2)

      expect(Order.list).to eql [order1, order2]
    end
  end

  describe Order, "#create" do
    it "creates, saves, and returns a new Order with the data" do
      order_data = double
      new_order = double
      expect(Order).to receive(:new).with(order_data).and_return(new_order)
      expect(new_order).to receive(:save).and_return(true)
      returned_order = Order.create(order_data)
      expect(returned_order).to eql new_order
    end
  end

  describe Order, "#save" do
    context "when it has an id" do
      it "performs a patch with the data" do
        order = Order.new(:id => 123)
        order.gift_message = "My awesome gift message!"
        expect(Printfection).to receive(:patch).
                                with("/orders/123", {:gift_message => "My awesome gift message!"})
        order.save
      end
    end

    context "when it doesn't have an id" do
      it "performs a post with the data" do
        order = Order.new
        order.gift_message = "My awesome gift message!"
        expect(Printfection).to receive(:post).
                                with("/orders", {:gift_message => "My awesome gift message!"})
        order.save
      end
    end
  end

  describe Order, "#place" do
    it "performs a post to place the order" do
      order = Order.new(:id => 123)
      expect(Printfection).to receive(:post).
                              with("/orders/123/place")
      order.place
    end

    context "when it is a new order" do
      it "raises an exception" do
        order = Order.new
        expect(order).to receive(:new?).and_return(true)
        expect { order.place }.to raise_exception
      end
    end
  end

  describe Order, "#cancel" do
    it "performs a delete on the order" do
      order = Order.new(:id => 123)
      expect(Printfection).to receive(:delete).with("/orders/123")
      order.cancel
    end
  end

  describe Order, "#id" do
    it "returns the order's id" do
      order = Order.new id: 123
      expect(order.id).to eql 123
    end

    it "returns an integer" do
      order = Order.new id: "123"
      expect(order.id).to eql 123
    end
  end

  describe Order, "#created_at" do
    it "returns a DateTime for when the order was created" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      order = Order.new created_at: date_str
      expect(order.created_at).to eql parsed_date
    end
  end

  describe Order, "#campaign_id" do
    it "returns the order's campaign id" do
      order = Order.new campaign_id: 456
      expect(order.campaign_id).to eql 456
    end

    it "returns an integer" do
      order = Order.new campaign_id: "456"
      expect(order.campaign_id).to eql 456
    end
  end

  describe Order, "#campaign" do
    it "returns the order's Campaign" do
      pending
      fail
    end
  end

  describe Order, "#status" do
    it "returns the order's status" do
      order = Order.new status: "open"
      expect(order.status).to eql "open"
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

  describe Order, "#code" do
    it "returns the order's unique code that can be used for redemption" do
      order = Order.new code: "xyz123"
      expect(order.code).to eql "xyz123"
    end

    it "returns nil when the order doesn't have a redemption code" do
      order = Order.new code: nil
      expect(order.code).to eql nil
    end
  end

  describe Order, "#url" do
    it "returns the order's unique url that can be used for redemption" do
      order = Order.new url: "https://printfection.com/order/123"
      expect(order.url).to eql "https://printfection.com/order/123"
    end

    it "returns nil when the order doesn't have a redemption url" do
      order = Order.new url: nil
      expect(order.url).to eql nil
    end
  end

  describe Order, "#gift?" do
    it "returns true when the order is a gift" do
      order = Order.new gift: true
      expect(order.gift?).to eql true
    end

    it "returns false when the order is not a gift" do
      order = Order.new gift: false
      expect(order.gift?).to eql false
    end
  end

  describe Order, "#gift_message" do
    it "returns the order's gift message if it has one" do
      order = Order.new gift_message: "Thanks for being awesome!"
      expect(order.gift_message).to eql "Thanks for being awesome!"
    end

    it "returns nil if the order doesn't have a gift message" do
      order = Order.new gift_message: nil
      expect(order.gift_message).to eql nil
    end
  end

  describe Order, "#ship_to" do
    it "returns an object with details about the order's shipping address" do
      order = Order.new ship_to: {
        name:     "Joseph Schmo",
        address:  "123 Main Street",
        address2: "Suite 101",
        company:  "ACME Inc.",
        city:     "Denver",
        state:    "Colorado",
        zip:      "80202",
        country:  "United States"
      }

      expect(order.ship_to.name).to eql "Joseph Schmo"
      expect(order.ship_to.address).to eql "123 Main Street"
      expect(order.ship_to.address2).to eql "Suite 101"
      expect(order.ship_to.company).to eql "ACME Inc."
      expect(order.ship_to.city).to eql "Denver"
      expect(order.ship_to.state).to eql "Colorado"
      expect(order.ship_to.zip).to eql "80202"
      expect(order.ship_to.country).to eql "United States"
    end
  end

  describe Order, "#line_items" do
    it "returns an array of the order's line_items" do
      pending
      fail
    end
  end

  describe Order, "#manifest" do
    it "returns the order's manifest" do
      manifest = double
      manifest_data = double
      order = Order.new manifest: manifest_data
      expect(Manifest).to receive(:new).
                          with(manifest_data).
                          and_return(manifest)
      expect(order.manifest).to eql manifest
    end
  end
end

