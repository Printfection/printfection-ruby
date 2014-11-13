module Printfection
  class Image < Resource
    expose :id,     :as => :integer, :readonly => true
    expose :name,   :as => :string, :readonly => true
    expose :assets, :as => :object, :readonly => true
  end
end

