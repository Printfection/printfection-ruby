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

