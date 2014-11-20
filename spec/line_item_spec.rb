require 'printfection'

module Printfection
  describe LineItem do
    it_behaves_like "Resource"
    include_examples "Actions::Retrieve"
    include_examples "Actions::Create"
    include_examples "Actions::Update"
    include_examples "Actions::Delete"
  end

  describe LineItem, ".uri" do
    it "returns the base resource uri" do
      expect(LineItem.uri).to eql "/lineitems"
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
end

