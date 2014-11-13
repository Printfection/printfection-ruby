module Printfection
  class Item < Resource
    include Actions::Retrieve
    include Actions::List

    expose :id,         :as => :integer,  :readonly => true
    expose :name,       :as => :string,   :readonly => true
    expose :color,      :as => :string,   :readonly => true
    expose :created_at, :as => :datetime, :readonly => true

    def self.url
      "/items"
    end

    def product
      Product.new(data[:product])
    end
  end
end

