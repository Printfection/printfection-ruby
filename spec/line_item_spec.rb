require 'printfection'

module Printfection
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

