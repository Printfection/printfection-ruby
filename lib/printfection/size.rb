module Printfection
  class Size < Resource
    expose :id,   :as => :integer,      :readonly => true
    expose :name, :as => :string,       :readonly => true
    expose :short_name, :as => :string, :readonly => true
    expose :stock, :as => :object,      :readonly => true
  end
end

