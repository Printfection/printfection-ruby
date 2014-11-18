module Printfection
  class Image < Resource
    property :id, transform_with: lambda { |v| v.to_i }
    property :name
    property :assets
    coerce_key :assets, Hashie::Mash
  end
end

