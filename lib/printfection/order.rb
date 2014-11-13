module Printfection
  class Order < Resource
    include Actions::Retrieve
    include Actions::List
    include Actions::Create
    include Actions::Update
    include Actions::Delete

    expose :id,           :as => :integer, :readonly => true
    expose :campaign_id,  :as => :integer
    expose :created_at,   :as => :datetime, :readonly => true
    expose :code,         :readonly => true
    expose :url,          :readonly => true
    expose :gift,         :as => :boolean
    expose :gift_message
    expose :ship_to,      :as => :object

    def self.url
      "/orders"
    end

    def place
      Printfection.post("/orders/#{id}/place")
    end

    def cancel
      delete
    end

    STATUS_CODES = {
      "unknown"   => -2,
      "cancelled" => -1,
      "open"      => 0,
      "received"  => 1,
      "approved"  => 2,
      "processed" => 3,
      "shipped"   => 4,
      "completed" => 5
    }

    def status
      data[:status].downcase
    end

    def status_code
      STATUS_CODES[status]
    end

    def open?
      status_code == 0
    end

    def cancelled?
      status_code == -1
    end

    def received?
      status_code >= 1
    end

    def approved?
      status_code >= 2
    end

    def processed?
      status_code >= 3
    end

    def shipped?
      status_code >= 4
    end

    def completed?
      status_code == 5
    end

    def manifest
      Manifest.new(data[:manifest])
    end

  end
end

