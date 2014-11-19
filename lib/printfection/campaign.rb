module Printfection
  class Campaign < Resource
    include Hashie::Extensions::Coercion
    extend Actions::Retrieve
    extend Actions::List

    property :id, transform_with: lambda { |v| v.to_i }
    property :name
    property :type, transform_with: lambda { |v| v.downcase }
    property :active
    property :archived
    property :url
    property :created_at, transform_with: lambda { |v| DateTime.parse(v) }

    def self.url
      "/campaigns"
    end
  end
end

