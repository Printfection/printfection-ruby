require "json"
require "hashie"
require "restclient"
require "forwardable"
require "date"

require "printfection/version"
require "printfection/util"
require "printfection/error"
require "printfection/api"
require "printfection/transforms"
require "printfection/relation"
require "printfection/resource"
require "printfection/actions"
require "printfection/address"
require "printfection/product"
require "printfection/size"
require "printfection/asset"
require "printfection/campaign"
require "printfection/item"
require "printfection/line_item"
require "printfection/manifest"
require "printfection/order"

module Printfection
  extend API
end

