require "json"
require "ostruct"
require "restclient"

require "printfection/version"
require "printfection/error"
require "printfection/util"
require "printfection/api"
require "printfection/resource"
require "printfection/actions"
require "printfection/product"
require "printfection/size"
require "printfection/image"
require "printfection/item"
require "printfection/campaign"
require "printfection/order"
require "printfection/line_item"
require "printfection/manifest"

module Printfection
  extend API
end

