require 'printfection'

module Printfection
  describe LineItem do
    it_behaves_like "Resource"
    include_examples "Actions::Retrieve"
    include_examples "Actions::Create"
    include_examples "Actions::Update"
    include_examples "Actions::Delete"
  end

  describe LineItem, ".url" do
    it "returns the base resource url" do
      expect(LineItem.url).to eql "/lineitems"
    end
  end

  describe LineItem, "properties" do

    let(:json) do
      JSON.parse <<-JSON
        {
          "id": 123,
          "object": "lineitem",
          "order_id": 1,
          "item_id": 1,
          "size_id": 2,
          "quantity": 3,
          "created_at": "2014-09-12T10:22:37Z"
        }
      JSON
    end

    it "gives access to JSON properties" do
      line_item = LineItem.new(json)
      expect(line_item.id).to eql 123
      expect(line_item.order_id).to eql 1
      expect(line_item.item_id).to eql 1
      expect(line_item.size_id).to eql 2
      expect(line_item.quantity).to eql 3
      expect(line_item.created_at).to eql DateTime.parse("2014-09-12T10:22:37Z")
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

