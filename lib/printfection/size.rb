module Printfection
  class Size < Resource
    property :id, transform_with: Transforms::Integer
    property :name
    property :short_name

    property :stock
    coerce_key :stock, Hashie::Mash
  end
end

