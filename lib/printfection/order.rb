module Printfection
  class Order < Resource
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

    expose :id,           :as => :integer
    expose :campaign_id,  :as => :integer
    expose :created_at,   :as => :datetime
    expose :code
    expose :url
    expose :gift,         :as => :boolean
    expose :gift_message

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

    def ship_to
      OpenStruct.new(data[:ship_to])
    end

    def manifest
      Manifest.new(data[:manifest])
    end

  end
end

