require 'printfection'

module Printfection
  describe Resource, "relation" do
    it "saves its relation" do
      relation = double
      resource = Resource.new
      resource.relation = relation
      expect(resource.relation).to eql relation
    end
  end
end

module Printfection
  describe Resource, "#uri" do
    let(:widget_klass) do
      Class.new(Resource) do
        property :id

        def self.uri
          "/widgets"
        end
      end
    end

    context "when it does not have a relation" do
      it "returns its class's uri joined with its id" do
        widget = widget_klass.new(id: 123)
        expect(widget.uri).to eql "/widgets/123"
      end
    end

    context "when it has a relation" do
      it "returns its relations's uri joined with its id" do
        relation = double(:uri => "/manufacturers/123/widgets")
        widget = widget_klass.new(id: 456)
        widget.relation = relation
        expect(widget.uri).to eql "/manufacturers/123/widgets/456"
      end
    end
  end
end

module Printfection
  describe Resource, "#changes" do
    it "returns a hash of the changed properties" do
      klass = Class.new(Resource) do
        property :size
        property :color
        property :price
      end
      resource = klass.new(size: "Large", color: "Blue", price: 123.45)
      resource.price = 678.90
      expect(resource.changes).to eql({"price" => 678.90})
      resource.size = "Medium"
      expect(resource.changes).to eql({"size" => "Medium", "price" => 678.90})
      resource.price = 123.45
      expect(resource.changes).to eql({"size" => "Medium"})
    end
  end
end

