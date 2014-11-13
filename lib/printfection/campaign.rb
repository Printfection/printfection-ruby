module Printfection
  class Campaign < Resource
    expose :id,         :as => :integer,  :readonly => true
    expose :name,       :as => :string
    expose :type,       :as => :string,   :readonly => true
    expose :created_at, :as => :datetime, :readonly => true
    expose :active,     :as => :boolean,  :readonly => true
    expose :archived,   :as => :boolean,  :readonly => true
    expose :url, :readonly => true
  end
end

