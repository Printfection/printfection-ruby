module Printfection
  class Item < Resource
    include Actions::Retrieve
    include Actions::List

    property :id, transform_with: lambda { |v| v.to_i }
    property :name
    property :color
    property :created_at, transform_with: lambda { |v| DateTime.parse(v) }

    property :product
    coerce_key :product, Product

    property :campaigns
    property :sizes
    property :images

    def self.url
      "/items"
    end
  end
end

