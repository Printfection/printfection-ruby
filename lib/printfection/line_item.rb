module Printfection
  class LineItem < Resource
    expose :id,         :as => :integer
    expose :order_id,   :as => :integer
    expose :item_id,    :as => :integer
    expose :size_id,    :as => :integer
    expose :quantity,   :as => :integer
    expose :created_at, :as => :datetime
  end
end

