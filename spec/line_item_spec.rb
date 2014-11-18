require 'printfection'

module Printfection
  describe LineItem, ".url" do
    it "returns the base resource url" do
      expect(LineItem.url).to eql "/lineitems"
    end
  end

  describe LineItem, "attributes" do
    it "exposes its id" do
      expect(LineItem).to expose_integer :id
    end

    it "exposes its order_id" do
      expect(LineItem).to expose_integer :order_id
    end

    it "exposes its item_id" do
      expect(LineItem).to expose_integer :item_id
    end

    it "exposes its size_id" do
      expect(LineItem).to expose_integer :size_id
    end

    it "exposes its quantity" do
      expect(LineItem).to expose_integer :quantity
    end

    it "exposes its created_at" do
      expect(LineItem).to expose_datetime :created_at
    end
  end
end

module Printfection
  describe LineItem, ".retrieve" do
    it "returns the LineItem for the given id" do
      data = double
      line_item = double
      expect(Printfection).to receive(:get).with("/lineitems/123").and_return(data)
      expect(LineItem).to receive(:new).with(data).and_return(line_item)
      expect(LineItem.retrieve(123)).to eql line_item
    end
  end

  describe LineItem, "#create" do
    it "creates, saves, and returns a new LineItem with the data" do
      params = double
      response = double
      new_line_item = double

      expect(Printfection).to receive(:post).
                              with("/lineitems", params).
                              and_return(response)

      expect(LineItem).to receive(:new).
                       with(response).
                       and_return(new_line_item)

      line_item = LineItem.create(params)
      expect(line_item).to eql new_line_item
    end
  end

  describe LineItem, "#save" do
    it "performs a patch with the data" do
      line_item = LineItem.new(:id => 123)
      line_item.quantity = 2
      expect(Printfection).to receive(:patch).
                              with("/lineitems/123", {:quantity => 2})
      line_item.save
    end
  end

  describe LineItem, "#delete" do
    it "performs a delete on the line_item" do
      line_item = LineItem.new(:id => 123)
      expect(Printfection).to receive(:delete).with("/lineitems/123")
      line_item.delete
    end
  end

  describe LineItem, "#order" do
    it "returns the Order this line item belongs to" do
      pending
      fail
    end
  end

  describe LineItem, "#item" do
    it "returns the Item this line item belongs to" do
      pending
      fail
    end
  end

  describe LineItem, "#size" do
    it "returns the Size of the item in this lineitem" do
      pending
      fail
    end
  end
end

