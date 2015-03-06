module Printfection
  class Product < Resource
    property :id, transform_with: Transforms::Integer
    property :name
  end
end

