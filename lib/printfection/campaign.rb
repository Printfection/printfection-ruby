module Printfection
  class Campaign < Resource
    include Hashie::Extensions::Coercion
    extend Actions::Retrieve
    extend Actions::List

    property :id, transform_with: Transforms::Integer
    property :name
    property :type
    property :active
    property :archived
    property :url
    property :created_at, transform_with: Transforms::Date

    def self.uri
      "/campaigns"
    end
  end
end

