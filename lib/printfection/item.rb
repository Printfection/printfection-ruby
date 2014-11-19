module Printfection
  class Item < Resource
    extend Actions::Retrieve
    extend Actions::List

    property :id, transform_with: lambda { |v| v.to_i }
    property :name
    property :color
    property :created_at, transform_with: lambda { |v| DateTime.parse(v) }

    property :product
    coerce_key :product, Product

    property :campaigns
    coerce_key :campaigns, Array[Campaign]

    property :sizes
    coerce_key :sizes, Array[Size]

    property :images
    coerce_key :images, Array[Image]

    def self.uri
      "/items"
    end
  end
end

