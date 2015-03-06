module Printfection
  class Order < Resource
    extend Actions::Retrieve
    extend Actions::List
    extend Actions::Create
    include Actions::Update
    include Actions::Delete

    property :id,          transform_with: Transforms::Integer
    property :campaign_id, transform_with: Transforms::Integer
    property :created_at,  transform_with: Transforms::Date
    property :status,      transform_with: lambda { |v| v.downcase }
    property :code
    property :url
    property :gift
    property :gift_message

    property :line_items, from: :lineitems
    coerce_key :line_items, Array[LineItem]

    property :ship_to
    coerce_key :ship_to, Address

    property :manifest
    coerce_key :manifest, Manifest

    def self.uri
      "/orders"
    end

    def line_items
      Relation.new(
        parent:   self,
        children: self[:line_items],
        klass:    LineItem,
        path:     '/lineitems',
        keys:     {:id => :order_id},
        actions:  [Actions::Retrieve, Actions::Create]
      )
    end

    def campaign
      Campaign.retrieve(campaign_id)
    end

    def place
      Printfection.post Util.join_uri(uri, "/place")
    end

    def cancel
      delete
    end

    STATUS_CODES = {
      "unknown"   => -2,
      "cancelled" => -1,
      "open"      => 0,
      "received"  => 1,
      "approved"  => 2,
      "processed" => 3,
      "shipped"   => 4,
      "completed" => 5
    }

    def status_code
      STATUS_CODES[status]
    end

    def open?
      status_code == 0
    end

    def cancelled?
      status_code == -1
    end

    def received?
      status_code >= 1
    end

    def approved?
      status_code >= 2
    end

    def processed?
      status_code >= 3
    end

    def shipped?
      status_code >= 4
    end

    def completed?
      status_code == 5
    end

  end
end

