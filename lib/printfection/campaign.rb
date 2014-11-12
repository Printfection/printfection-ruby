module Printfection
  class Campaign

    def initialize(data)
      @data = data
    end

    def id
      data[:id].to_i
    end

    def name
      data[:name]
    end

    def type
      data[:type]
    end

    def created_at
      DateTime.parse(data[:created_at])
    end

    def active?
      data[:active]
    end

    def archived?
      data[:archived]
    end

    def url
      data[:url]
    end

    private

    def data
      @data
    end

  end
end

