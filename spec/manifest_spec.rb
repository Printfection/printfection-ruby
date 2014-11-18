require 'printfection'

module Printfection
  describe Manifest, "attributes" do
    it "exposes its subtotal" do
      expect(Manifest).to expose_float :subtotal
    end

    it "exposes its coupon" do
      expect(Manifest).to expose_float :coupon
    end

    it "exposes its tax" do
      expect(Manifest).to expose_float :tax
    end

    it "exposes its shipping" do
      expect(Manifest).to expose_float :shipping
    end

    it "exposes its total" do
      expect(Manifest).to expose_float :total
    end

    it "exposes its created_at" do
      expect(Manifest).to expose_datetime :created_at
    end

    it "exposes its received_at" do
      expect(Manifest).to expose_datetime :received_at
    end

    it "exposes its approved_at" do
      expect(Manifest).to expose_datetime :approved_at
    end

    it "exposes its processed_at" do
      expect(Manifest).to expose_datetime :processed_at
    end

    it "exposes its shipped_at" do
      expect(Manifest).to expose_datetime :shipped_at
    end

    it "exposes its completed_at" do
      expect(Manifest).to expose_datetime :completed_at
    end
  end
end

