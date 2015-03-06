module Printfection
  class Asset < Resource
    property :id, transform_with: Transforms::Integer
    property :type
    property :name
    property :perspective
    property :url
    property :notes
  end
end

