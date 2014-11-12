module Printfection
  class Image

    def initialize(data)
      @data = data
    end

    def id
      data[:id].to_i
    end

    def name
      data[:name]
    end

    def assets
      OpenStruct.new(data[:assets])
    end

    private

    def data
      @data
    end

  end
end

