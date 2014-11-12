module Printfection
  class Manifest < Resource
    expose :subtotal, :as => :float
    expose :coupon,   :as => :float
    expose :tax,      :as => :float
    expose :shipping, :as => :float
    expose :total,    :as => :float
    expose :created_at,   :as => :datetime
    expose :received_at,  :as => :datetime
    expose :approved_at,  :as => :datetime
    expose :processed_at, :as => :datetime
    expose :shipped_at,   :as => :datetime
    expose :completed_at, :as => :datetime
  end
end

