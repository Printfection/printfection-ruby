module Printfection
  class Size

    def initialize(data)
      @data = data
    end

    def id
      data[:id].to_i
    end

    def name
      data[:name]
    end

    def short_name
      data[:short_name]
    end

    def stock
      OpenStruct.new(data[:stock])
    end

    private

    def data
      @data
    end

  end
end

