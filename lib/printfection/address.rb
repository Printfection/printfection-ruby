module Printfection
  class Address < Resource
    property :name
    property :address
    property :address2
    property :company
    property :city
    property :state
    property :zip_code, from: :zip
    property :country
  end
end

