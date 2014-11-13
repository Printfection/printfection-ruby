require "ostruct"

require "printfection/version"
require "printfection/util"
require "printfection/resource"
require "printfection/product"
require "printfection/size"
require "printfection/image"
require "printfection/item"
require "printfection/campaign"
require "printfection/order"
require "printfection/line_item"
require "printfection/manifest"

module Printfection
  def self.get(url)
    raise "Not Implemented"
  end

  def self.post(url, data={})
    raise "Not Implemented"
  end

  def self.patch(url, data={})
    raise "Not Implemented"
  end

  def self.delete(url)
    raise "Not Implemented"
  end
end

