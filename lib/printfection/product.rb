module Printfection
  class Product < Resource
    property :id, transform_with: lambda { |v| v.to_i }
    property :name
  end
end

