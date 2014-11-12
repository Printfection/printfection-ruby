require 'printfection'

module Printfection
  describe Manifest, "#subtotal" do
    it "returns the manifest's subtotal" do
      manifest = Manifest.new subtotal: 123.45
      expect(manifest.subtotal).to eql 123.45
    end

    it "returns a float" do
      manifest = Manifest.new subtotal: 123
      expect(manifest.subtotal).to eql 123.0
    end

    it "returns 0.0 if it doesn't have a subtotal" do
      manifest = Manifest.new subtotal: nil
      expect(manifest.subtotal).to eql 0.0
    end
  end

  describe Manifest, "#coupon" do
    it "returns the manifest's coupon" do
      manifest = Manifest.new coupon: 123.45
      expect(manifest.coupon).to eql 123.45
    end

    it "returns a float" do
      manifest = Manifest.new coupon: 123
      expect(manifest.coupon).to eql 123.0
    end

    it "returns 0.0 if it doesn't have a coupon" do
      manifest = Manifest.new coupon: nil
      expect(manifest.coupon).to eql 0.0
    end
  end

  describe Manifest, "#tax" do
    it "returns the manifest's tax" do
      manifest = Manifest.new tax: 123.45
      expect(manifest.tax).to eql 123.45
    end

    it "returns a float" do
      manifest = Manifest.new tax: 123
      expect(manifest.tax).to eql 123.0
    end

    it "returns 0.0 if it doesn't have a tax" do
      manifest = Manifest.new tax: nil
      expect(manifest.tax).to eql 0.0
    end
  end

  describe Manifest, "#shipping" do
    it "returns the manifest's shipping" do
      manifest = Manifest.new shipping: 123.45
      expect(manifest.shipping).to eql 123.45
    end

    it "returns a float" do
      manifest = Manifest.new shipping: 123
      expect(manifest.shipping).to eql 123.0
    end

    it "returns 0.0 if it doesn't have a shipping" do
      manifest = Manifest.new shipping: nil
      expect(manifest.shipping).to eql 0.0
    end
  end

  describe Manifest, "#total" do
    it "returns the manifest's total" do
      manifest = Manifest.new total: 123.45
      expect(manifest.total).to eql 123.45
    end

    it "returns a float" do
      manifest = Manifest.new total: 123
      expect(manifest.total).to eql 123.0
    end

    it "returns 0.0 if it doesn't have a total" do
      manifest = Manifest.new total: nil
      expect(manifest.total).to eql 0.0
    end
  end

  describe Manifest, "#line_items" do
    it "returns an array of the manifest's line_items" do
      pending
      fail
    end
  end

  describe Manifest, "#shipments" do
    it "returns an array of the manifest's shipments" do
      pending
      fail
    end
  end

  describe Manifest, "#created_at" do
    it "returns a DateTime for when the manifest was created" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      manifest = Manifest.new created_at: date_str
      expect(manifest.created_at).to eql parsed_date
    end
  end

  describe Manifest, "#received_at" do
    it "returns a DateTime for when the manifest was received" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      manifest = Manifest.new received_at: date_str
      expect(manifest.received_at).to eql parsed_date
    end
  end

  describe Manifest, "#approved_at" do
    it "returns a DateTime for when the manifest was approved" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      manifest = Manifest.new approved_at: date_str
      expect(manifest.approved_at).to eql parsed_date
    end
  end

  describe Manifest, "#processed_at" do
    it "returns a DateTime for when the manifest was processed" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      manifest = Manifest.new processed_at: date_str
      expect(manifest.processed_at).to eql parsed_date
    end
  end

  describe Manifest, "#shipped_at" do
    it "returns a DateTime for when the manifest was shipped" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      manifest = Manifest.new shipped_at: date_str
      expect(manifest.shipped_at).to eql parsed_date
    end
  end

  describe Manifest, "#completed_at" do
    it "returns a DateTime for when the manifest was completed" do
      date_str = "2014-09-12T10:22:37Z"
      parsed_date = DateTime.parse(date_str)
      manifest = Manifest.new completed_at: date_str
      expect(manifest.completed_at).to eql parsed_date
    end
  end
end


# "manifest": {
#    lineitems: [],
#    subtotal: 0,
#    coupon: 0,
#    tax: 0,
#    shipping: 0,
#    total: 0,
#    shipments: [],
#    created_at: "2014-09-12T10:22:37Z",
#    received_at: null,
#    approved_at: null,
#    processed_at: null,
#    shipped_at: null,
#    completed_at: null
#  }
