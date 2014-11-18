module Printfection
  class LineItem < Resource
    include Actions::Retrieve
    include Actions::Create
    include Actions::Update
    include Actions::Delete

    property :id,         transform_with: lambda { |v| v.to_i }
    property :order_id,   transform_with: lambda { |v| v.to_i }
    property :item_id,    transform_with: lambda { |v| v.to_i }
    property :size_id,    transform_with: lambda { |v| v.to_i }
    property :quantity,   transform_with: lambda { |v| v.to_i }
    property :created_at, transform_with: lambda { |v| DateTime.parse(v) }

    def self.url
      "/lineitems"
    end

  end
end

