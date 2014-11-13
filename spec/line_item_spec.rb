require 'printfection'

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

  describe LineItem, "#id" do
    it "returns the line item's id" do
      line_item = LineItem.new id: 123
      expect(line_item.id).to eql 123
    end

    it "returns an integer" do
      line_item = LineItem.new id: "123"
      expect(line_item.id).to eql 123
    end
  end

  describe LineItem, "#quantity" do
    it "returns the quantity of items in the lineitem" do
      line_item = LineItem.new quantity: 9
      expect(line_item.quantity).to eql 9
    end

    it "returns 0 if it does not have a quantity" do
      line_item = LineItem.new quantity: nil
      expect(line_item.quantity).to eql 0
    end
  end

  describe LineItem, "#created_at" do
    it "returns a DateTime for when the line item was created" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      line_item = LineItem.new created_at: date_str
      expect(line_item.created_at).to eql parsed_date
    end
  end

  describe LineItem, "#order_id" do
    it "returns the id of the Order this line item belongs to" do
      line_item = LineItem.new order_id: 123
      expect(line_item.order_id).to eql 123
    end

    it "returns an integer" do
      line_item = LineItem.new order_id: "123"
      expect(line_item.order_id).to eql 123
    end
  end

  describe LineItem, "#order" do
    it "returns the Order this line item belongs to" do
      pending
      fail
    end
  end

  describe LineItem, "#item_id" do
    it "returns the id of the item in the lineitem" do
      line_item = LineItem.new item_id: 123
      expect(line_item.item_id).to eql 123
    end

    it "returns an integer" do
      line_item = LineItem.new item_id: "123"
      expect(line_item.item_id).to eql 123
    end
  end

  describe LineItem, "#item" do
    it "returns the Item this line item belongs to" do
      pending
      fail
    end
  end

  describe LineItem, "#size_id" do
    it "returns the id of the size of the item in the lineitem" do
      line_item = LineItem.new size_id: 123
      expect(line_item.size_id).to eql 123
    end

    it "returns an integer" do
      line_item = LineItem.new size_id: "123"
      expect(line_item.size_id).to eql 123
    end

    it "returns 0 if it does not have a size" do
      line_item = LineItem.new size_id: nil
      expect(line_item.size_id).to eql 0
    end
  end

  describe LineItem, "#size" do
    it "returns the Size of the item in this lineitem" do
      pending
      fail
    end
  end
end

