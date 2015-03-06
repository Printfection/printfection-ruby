module Printfection
  class Item < Resource
    extend Actions::Retrieve
    extend Actions::List

    property :id, transform_with: Transforms::Integer
    property :name
    property :color
    property :created_at, transform_with: Transforms::Date

    property :product
    coerce_key :product, Product

    property :campaigns
    coerce_key :campaigns, Array[Campaign]

    property :sizes
    coerce_key :sizes, Array[Size]

    property :assets
    coerce_key :assets, Array[Asset]

    def self.uri
      "/items"
    end
  end
end

