module Printfection
  class Item < Resource
    expose :id,         :as => :integer,  :readonly => true
    expose :name,       :as => :string,   :readonly => true
    expose :color,      :as => :string,   :readonly => true
    expose :created_at, :as => :datetime, :readonly => true

    def self.retrieve(id)
      Item.new Printfection.get("/items/#{id.to_i}")
    end

    def self.list
      Printfection.get("/items").map do |d|
        Item.new(d)
      end
    end

    def product
      Product.new(data[:product])
    end
  end
end

