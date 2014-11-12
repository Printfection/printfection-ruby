module Printfection
  class Resource

    def self.expose(attribute, options={})
      attribute = attribute.to_s
      type = options[:as]

      case type
      when :boolean
        expose_boolean(attribute)
      when :integer
        expose_integer(attribute)
      when :float
        expose_float(attribute)
      when :string
        expose_string(attribute)
      when :datetime
        expose_datetime(attribute)
      when :object
        expose_object(attribute)
      else
        expose_raw(attribute)
      end
    end

    def self.expose_raw(attribute)
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
         def #{attribute}(&block)
           data[:#{attribute}]
         end
      EOS
    end

    def self.expose_boolean(attribute)
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
         def #{attribute}(&block)
           data[:#{attribute}] == true
         end

         def #{attribute}?(&block)
           #{attribute}
         end
      EOS
    end

    def self.expose_integer(attribute)
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
         def #{attribute}(&block)
           data[:#{attribute}].to_i
         end
      EOS
    end

    def self.expose_float(attribute)
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
         def #{attribute}(&block)
           data[:#{attribute}].to_f
         end
      EOS
    end

    def self.expose_string(attribute)
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
         def #{attribute}(&block)
           data[:#{attribute}].to_s
         end
      EOS
    end

    def self.expose_datetime(attribute)
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
         def #{attribute}(&block)
           DateTime.parse(data[:#{attribute}])
         end
      EOS
    end

    def self.expose_object(attribute)
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
         def #{attribute}(&block)
           OpenStruct.new(data[:#{attribute}])
         end
      EOS
    end

    def initialize(data)
      @data = data
    end

    private

    def data
      @data
    end
  end
end

