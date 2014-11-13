module Printfection
  class LineItem < Resource
    include Operations::Retrieve
    include Operations::Create
    include Operations::Update
    include Operations::Delete

    expose :id,         :as => :integer, :readonly => true
    expose :order_id,   :as => :integer
    expose :item_id,    :as => :integer
    expose :size_id,    :as => :integer
    expose :quantity,   :as => :integer
    expose :created_at, :as => :datetime, :readonly => true

    def self.url
      "/lineitems"
    end

  end
end

