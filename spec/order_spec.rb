require 'printfection'

module Printfection
  describe Order, "attributes" do
    it "exposes its id" do
      expect(Order).to expose_integer :id
    end

    it "exposes its campaign_id" do
      expect(Order).to expose_integer :campaign_id
    end

    it "exposes its created_at" do
      expect(Order).to expose_datetime :created_at
    end

    it "exposes its code" do
      expect(Order).to expose :code
    end

    it "exposes its url" do
      expect(Order).to expose :url
    end

    it "exposes its gift" do
      expect(Order).to expose_boolean :gift
    end

    it "exposes its gift_message" do
      expect(Order).to expose :gift_message
    end
  end
end


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
      params = double
      response = double
      new_order = double

      expect(Printfection).to receive(:post).
                              with("/orders", params).
                              and_return(response)

      expect(Order).to receive(:new).
                       with(response).
                       and_return(new_order)

      order = Order.create(params)
      expect(order).to eql new_order
    end
  end

  describe Order, "#save" do
    it "performs a patch with the data" do
      order = Order.new(:id => 123)
      order.gift_message = "My awesome gift message!"
      expect(Printfection).to receive(:patch).
                              with("/orders/123", {:gift_message => "My awesome gift message!"})
      order.save
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

  describe Order, "#delete" do
    it "performs a delete on the order" do
      order = Order.new(:id => 123)
      expect(Printfection).to receive(:delete).with("/orders/123")
      order.delete
    end
  end

  describe Order, "#cancel" do
    it "deletds the order" do
      order = Order.new(:id => 123)
      expect(order).to receive(:delete)
      order.cancel
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

