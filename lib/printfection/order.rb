module Printfection
  class Order
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

    def initialize(data)
      @data = data
    end

    def id
      data[:id].to_i
    end

    def created_at
      DateTime.parse(data[:created_at])
    end

    def campaign_id
      data[:campaign_id].to_i
    end

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

    def code
      data[:code]
    end

    def url
      data[:url]
    end

    def gift?
      data[:gift]
    end

    def gift_message
      data[:gift_message]
    end

    def ship_to
      OpenStruct.new(data[:ship_to])
    end

    def manifest
      Manifest.new(data[:manifest])
    end

    private

    def data
      @data
    end

  end
end

