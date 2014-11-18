require "json"
require "hashie"
require "restclient"

require "printfection/version"
require "printfection/error"
require "printfection/util"
require "printfection/api"
require "printfection/resource"
require "printfection/actions"
require "printfection/address"
require "printfection/product"
require "printfection/size"
require "printfection/image"
require "printfection/item"
require "printfection/campaign"
require "printfection/manifest"
require "printfection/order"
require "printfection/line_item"

module Printfection
  extend API
end

