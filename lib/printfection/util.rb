module Printfection
  module Util

    def self.to_bool(value)
      case value
      when TrueClass
        return value
      when FalseClass
        return value
      when NilClass
        return false
      when String
        return true if value == true || value =~ (/^(true|1)$/i)
        return false if value == false || value.empty? || value =~ (/^(false|0)$/i)
        raise ArgumentError.new("invalid value for Boolean: \"#{value}\"")
      when Fixnum
        return true if value == 1
        return false if value == 0
        raise ArgumentError.new("invalid value for Boolean: \"#{value}\"")
      else
        raise ArgumentError.new("invalid value for Boolean: \"#{value}\"")
      end
    end

  end
end

