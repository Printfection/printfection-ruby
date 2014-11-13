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

    expose :id,           :as => :integer, :readonly => true
    expose :campaign_id,  :as => :integer
    expose :created_at,   :as => :datetime, :readonly => true
    expose :code,         :readonly => true
    expose :url,          :readonly => true
    expose :gift,         :as => :boolean
    expose :gift_message
    expose :ship_to,      :as => :object

    def self.retrieve(id)
      Order.new Printfection.get("/orders/#{id.to_i}")
    end

    def self.list
      Printfection.get("/orders").map do |d|
        Order.new(d)
      end
    end

    def self.create(data)
      order = Order.new(data)
      order.save
      order
    end

    def save
      if new?
        Printfection.post("/orders", changes)
      else
        Printfection.patch("/orders/#{id.to_i}", changes)
      end
    end

    def place
      raise "Orders must be saved before they can be placed" if new?
      Printfection.post("/orders/#{id.to_i}/place")
    end

    def cancel
      Printfection.delete("/orders/#{id.to_i}")
    end

    def new?
      return true if id.zero?
      return true if id.nil?
      return false
    end

    def changes
      dirty_data.keys.inject({}) do |diff, key|
        unless dirty_data[key] == clean_data[key]
          diff[key] = dirty_data[key]
        end
        diff
      end
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

    def manifest
      Manifest.new(data[:manifest])
    end

  end
end

