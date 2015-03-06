module Printfection
  module Util
    def self.join_uri(*args)
      Array(args).join("/").gsub(/\/{2,}/, "/").chomp("/")
    end
  end
end

