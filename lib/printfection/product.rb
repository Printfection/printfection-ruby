module Printfection
  class Product

    def initialize(data)
      @data = data
    end

    def id
      data[:id].to_i
    end

    def name
      data[:name]
    end

    private

    def data
      @data
    end
  end
end

