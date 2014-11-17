require 'printfection'

module Printfection
  describe Util, ".to_bool" do
    context "when true" do
      it "returns true" do
        expect(Util.to_bool(true)).to eql true
      end
    end

    context "when false" do
      it "returns false" do
        expect(Util.to_bool(false)).to eql false
      end
    end

    context "when nil" do
      it "returns false" do
        expect(Util.to_bool(nil)).to eql false
      end
    end

    context "when truthy string" do
      it "returns true" do
        expect(Util.to_bool("true")).to eql true
        expect(Util.to_bool("1")).to eql true
      end
    end

    context "when falsy string" do
      it "returns false" do
        expect(Util.to_bool("false")).to eql false
        expect(Util.to_bool("0")).to eql false
        expect(Util.to_bool("")).to eql false
      end
    end

    context "when invalid string" do
      it "raises ArgumentError" do
        expect { Util.to_bool("an invalid string") }.to raise_error ArgumentError
      end
    end

    context "when 1" do
      it "returns true" do
        expect(Util.to_bool(1)).to eql true
      end
    end

    context "when 0" do
      it "returns true" do
        expect(Util.to_bool(0)).to eql false
      end
    end

    context "when it is an invalid number" do
      it "raises ArgumentError" do
        expect { Util.to_bool(3) }.to raise_error ArgumentError
      end
    end

    context "when it is an invalid value" do
      it "raises ArgumentError" do
        sentinel = Class.new.new
        expect { Util.to_bool(sentinel) }.to raise_error ArgumentError
      end
    end
  end
end

