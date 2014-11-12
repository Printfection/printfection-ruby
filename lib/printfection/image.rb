module Printfection
  class Image < Resource
    expose :id,     :as => :integer
    expose :name,   :as => :string
    expose :assets, :as => :object
  end
end

