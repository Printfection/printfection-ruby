module Printfection
  class Item < Resource
    expose :id,   :as => :integer
    expose :name, :as => :string
    expose :created_at, :as => :datetime
    expose :color, :as => :string

    def product
      Product.new(data[:product])
    end
  end
end

