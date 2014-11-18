require 'printfection'

module Printfection
  class Widget < Resource
    include Actions::Retrieve
    include Actions::List
    include Actions::Create
    include Actions::Update
    include Actions::Delete

    expose :id
    expose :size
    expose :quantity

    def self.url
      "/widgets"
    end
  end

  describe Actions::Retrieve, ".retrieve" do
    it "returns an instance of the resource for the given id" do
      json_data = double
      widget = double

      expect(Printfection).to receive(:get).with("/widgets/123").and_return(json_data)
      expect(Widget).to receive(:new).with(json_data).and_return(widget)
      expect(Widget.retrieve(123)).to eql widget
    end
  end

  describe Actions::List, ".all" do
    it "returns an array of instances of the resource" do
      json_data1, json_data2 = double, double
      widget1, widget2 = double, double

      expect(Printfection).to receive(:get).with("/widgets").and_return([json_data1, json_data2])
      expect(Widget).to receive(:new).with(json_data1).and_return(widget1)
      expect(Widget).to receive(:new).with(json_data2).and_return(widget2)

      expect(Widget.all).to eql [widget1, widget2]
    end
  end

  describe Actions::Create, ".create" do
    it "creates, saves, and returns a new resource with the response data" do
      params = double
      json_data = double
      new_widget = double

      expect(Printfection).to receive(:post).
                              with("/widgets", params).
                              and_return(json_data)

      expect(Widget).to receive(:new).
                        with(json_data).
                        and_return(new_widget)

      widget = Widget.create(params)
      expect(widget).to eql new_widget
    end
  end

  describe Actions::Update, "#save" do
    it "performs a patch with the resource's changed data" do
      widget = Widget.new(:id => 123, :size => "Medium", :quantity => 5)
      widget.size = "Large"
      expect(Printfection).to receive(:patch).
                              with("/widgets/123", {:size => "Large"})
      widget.save
    end
  end

  describe Actions::Delete, "#delete" do
    it "performs a delete on the resource" do
      widget = Widget.new(:id => 123)
      expect(Printfection).to receive(:delete).with("/widgets/123")
      widget.delete
    end
  end
end

