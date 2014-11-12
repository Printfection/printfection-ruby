module Printfection
  class Product < Resource
    expose :id,   :as => :integer
    expose :name, :as => :string
  end
end

