module Printfection
  class Size < Resource
    expose :id,   :as => :integer
    expose :name, :as => :string
    expose :short_name, :as => :string

    def stock
      OpenStruct.new(data[:stock])
    end

  end
end

