module Printfection
  class Manifest
    def initialize(data)
      @data = data
    end

    def subtotal
      data[:subtotal].to_f
    end

    def coupon
      data[:coupon].to_f
    end

    def tax
      data[:tax].to_f
    end

    def shipping
      data[:shipping].to_f
    end

    def total
      data[:total].to_f
    end

    def created_at
      DateTime.parse(data[:created_at])
    end

    def received_at
      DateTime.parse(data[:received_at])
    end

    def approved_at
      DateTime.parse(data[:approved_at])
    end

    def processed_at
      DateTime.parse(data[:processed_at])
    end

    def shipped_at
      DateTime.parse(data[:shipped_at])
    end

    def completed_at
      DateTime.parse(data[:completed_at])
    end

    private

    def data
      @data
    end

  end
end

