module Printfection
  class LineItem < Resource
    extend Actions::Retrieve
    extend Actions::Create
    include Actions::Update
    include Actions::Delete

    property :id,         transform_with: lambda { |v| v.to_i }
    property :order_id,   transform_with: lambda { |v| v.to_i }
    property :item_id,    transform_with: lambda { |v| v.to_i }
    property :size_id,    transform_with: lambda { |v| v.to_i }
    property :quantity,   transform_with: lambda { |v| v.to_i }
    property :created_at, transform_with: lambda { |v| DateTime.parse(v) }

    def self.uri
      "/lineitems"
    end

  end
end

