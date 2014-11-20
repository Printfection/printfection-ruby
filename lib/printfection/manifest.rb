module Printfection
  class Manifest < Resource
    property :subtotal,     transform_with: Transforms::Float
    property :tax,          transform_with: Transforms::Float
    property :shipping,     transform_with: Transforms::Float
    property :fulfillment,  transform_with: Transforms::Float
    property :total,        transform_with: Transforms::Float
    property :created_at,   transform_with: Transforms::Date
    property :received_at,  transform_with: Transforms::Date
    property :approved_at,  transform_with: Transforms::Date
    property :processed_at, transform_with: Transforms::Date
    property :shipped_at,   transform_with: Transforms::Date
    property :completed_at, transform_with: Transforms::Date

    property :line_items, from: :lineitems
    coerce_key :line_items, Array[LineItem]

    property :shipments
    coerce_key :shipments, Array[Hashie::Mash]
  end
end

