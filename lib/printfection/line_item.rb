module Printfection
  class LineItem
    def initialize(data)
      @data = data
    end

    def id
      data[:id].to_i
    end

    def quantity
      data[:quantity].to_i
    end

    def created_at
      DateTime.parse(data[:created_at])
    end

    def order_id
      data[:order_id].to_i
    end

    def item_id
      data[:item_id].to_i
    end

    def size_id
      data[:size_id].to_i
    end

    private

    def data
      @data
    end

  end
end

