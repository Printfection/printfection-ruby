module Printfection
  class Image < Resource
    expose :id,   :as => :integer
    expose :name, :as => :string

    def assets
      OpenStruct.new(data[:assets])
    end
  end
end

