module Printfection
  class Product < Resource
    expose :id,   :as => :integer, :readonly => true
    expose :name, :as => :string,  :readonly => true
  end
end

