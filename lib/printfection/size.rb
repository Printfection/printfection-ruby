module Printfection
  class Size < Resource
    expose :id,   :as => :integer
    expose :name, :as => :string
    expose :short_name, :as => :string
    expose :stock, :as => :object
  end
end

