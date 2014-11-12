module Printfection
  class Campaign < Resource
    expose :id,         :as => :integer
    expose :name,       :as => :string
    expose :type,       :as => :string
    expose :url
    expose :created_at, :as => :datetime
    expose :active,     :as => :boolean
    expose :archived,   :as => :boolean
  end
end

