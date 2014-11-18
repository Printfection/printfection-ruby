module Printfection
  class Manifest < Resource
    property :subtotal,     transform_with: lambda { |v| v.to_f }
    property :coupon,       transform_with: lambda { |v| v.to_f }
    property :tax,          transform_with: lambda { |v| v.to_f }
    property :shipping,     transform_with: lambda { |v| v.to_f }
    property :fulfillment,  transform_with: lambda { |v| v.to_f }
    property :total,        transform_with: lambda { |v| v.to_f }
    property :created_at,   transform_with: lambda { |v| v.nil? ? nil : DateTime.parse(v) }
    property :received_at,  transform_with: lambda { |v| v.nil? ? nil : DateTime.parse(v) }
    property :approved_at,  transform_with: lambda { |v| v.nil? ? nil : DateTime.parse(v) }
    property :processed_at, transform_with: lambda { |v| v.nil? ? nil : DateTime.parse(v) }
    property :shipped_at,   transform_with: lambda { |v| v.nil? ? nil : DateTime.parse(v) }
    property :completed_at, transform_with: lambda { |v| v.nil? ? nil : DateTime.parse(v) }
    property :lineitems # XXX
    property :shipments # XXX
  end
end

