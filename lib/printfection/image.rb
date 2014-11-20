module Printfection
  class Image < Resource
    property :id, transform_with: Transforms::Integer
    property :name
    property :assets
    coerce_key :assets, Hashie::Mash
  end
end

