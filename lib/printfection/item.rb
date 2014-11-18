module Printfection
  class Item < Resource
    include Actions::Retrieve
    include Actions::List

    property :id, transform_with: lambda { |v| v.to_i }
    property :name
    property :color
    property :created_at, transform_with: lambda { |v| DateTime.parse(v) }
    property :product
    property :campaigns
    property :sizes
    property :images

    def self.url
      "/items"
    end

    def product
      Product.new(data[:product])
    end
  end
end

