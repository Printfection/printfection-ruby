module Printfection
  class Item
    def initialize(data)
      @data = data
    end

    def id
      data[:id].to_i
    end

    def name
      data[:name]
    end

    def color
      data[:color]
    end

    def created_at
      DateTime.parse(data[:created_at])
    end

    def product
      Product.new(data[:product])
    end

    private

    def data
      @data
    end

  end
end

