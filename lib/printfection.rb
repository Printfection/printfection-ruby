require "json"
require "hashie"
require "restclient"

require "printfection/version"
require "printfection/error"
require "printfection/api"
require "printfection/resource"
require "printfection/actions"
require "printfection/address"
require "printfection/product"
require "printfection/size"
require "printfection/image"
require "printfection/campaign"
require "printfection/item"
require "printfection/line_item"
require "printfection/manifest"
require "printfection/order"

module Printfection
  extend API
end

