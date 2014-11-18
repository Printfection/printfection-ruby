module Printfection
  class Size < Resource
    property :id, transform_with: lambda { |v| v.to_i }
    property :name
    property :short_name

    property :stock
    coerce_key :stock, Hashie::Mash
  end
end

