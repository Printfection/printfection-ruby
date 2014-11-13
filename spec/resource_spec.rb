require 'printfection'

module Printfection
  describe Resource, ".expose" do
    it "exposes the attribute as a getter method" do
      klass = Class.new(Resource) do
        expose :my_attribute
      end

      instance = klass.new({:my_attribute => "my attribute value"})
      expect(instance.my_attribute).to eql "my attribute value"
    end

    it "exposes the attribute as a setter method" do
      klass = Class.new(Resource) do
        expose :my_attribute
      end

      instance = klass.new({:my_attribute => "my attribute value 1"})
      instance.my_attribute = "my attribute value 2"
      expect(instance.my_attribute).to eql "my attribute value 2"
    end

    it "does not expose the setter method if it is readonly" do
      klass = Class.new(Resource) do
        expose :my_readonly_attribute, :readonly => :true
      end

      instance = klass.new({:my_readonly_attribute => "read only"})

      expect {
        instance.my_readonly_attribute = "new value"
      }.to raise_exception(NoMethodError)
    end

    it "converts to getters to the right type" do
      klass = Class.new(Resource) do
        expose :my_boolean_attribute,  :as => :boolean
        expose :my_integer_attribute,  :as => :integer
        expose :my_float_attribute,    :as => :float
        expose :my_string_attribute,   :as => :string
        expose :my_datetime_attribute, :as => :datetime
        expose :my_object_attribute,   :as => :object
      end

      instance = klass.new({
        :my_boolean_attribute => 1,
        :my_integer_attribute => "123",
        :my_float_attribute => 123,
        :my_string_attribute => nil,
        :my_datetime_attribute => "2014-09-12T10:22:37Z",
        :my_object_attribute => {
          :name => "Shirt",
          :price => 123.45
        }
      })

      expect(instance.my_boolean_attribute).to eql true
      expect(instance.my_integer_attribute).to eql 123
      expect(instance.my_float_attribute).to eql 123.0
      expect(instance.my_string_attribute).to eql ""
      expect(instance.my_datetime_attribute).to eql DateTime.parse "2014-09-12T10:22:37Z"
      expect(instance.my_object_attribute.name).to eql "Shirt"
      expect(instance.my_object_attribute.price).to eql 123.45
    end

    it "converts to the right type" do
      klass = Class.new(Resource) do
        expose :my_boolean_attribute,  :as => :boolean
        expose :my_integer_attribute,  :as => :integer
        expose :my_float_attribute,    :as => :float
        expose :my_string_attribute,   :as => :string
        expose :my_datetime_attribute, :as => :datetime
        expose :my_object_attribute,   :as => :object
      end

      instance = klass.new
      instance.my_boolean_attribute = 1
      instance.my_integer_attribute = "123"
      instance.my_float_attribute = 123
      instance.my_string_attribute = nil
      instance.my_datetime_attribute = "2014-09-12T10:22:37Z"
      instance.my_object_attribute = {
        :name => "Shirt",
        :price => 123.45
      }

      expect(instance.my_boolean_attribute).to eql true
      expect(instance.my_integer_attribute).to eql 123
      expect(instance.my_float_attribute).to eql 123.0
      expect(instance.my_string_attribute).to eql ""
      expect(instance.my_datetime_attribute).to eql DateTime.parse "2014-09-12T10:22:37Z"
      expect(instance.my_object_attribute.name).to eql "Shirt"
      expect(instance.my_object_attribute.price).to eql 123.45
    end


  end
end

