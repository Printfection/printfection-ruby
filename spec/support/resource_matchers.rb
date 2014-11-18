RSpec::Matchers.define :expose do |attribute|
  match do |klass|
    sentinel = double
    instance = klass.new({ attribute.to_sym => sentinel })
    instance.send(attribute.to_sym) == sentinel
  end
end

RSpec::Matchers.define :expose_boolean do |attribute|
  match do |klass|
    instance1 = klass.new({ attribute.to_sym => true })
    instance2 = klass.new({ attribute.to_sym => false })
    instance1.send("#{attribute}?") == true &&
      instance2.send("#{attribute}?") == false
  end
end

RSpec::Matchers.define :expose_integer do |attribute|
  match do |klass|
    instance1 = klass.new({ attribute.to_sym => 123 })
    instance2 = klass.new({ attribute.to_sym => "456" })
    instance1.send(attribute.to_sym) == 123 &&
      instance2.send(attribute.to_sym) == 456
  end
end

RSpec::Matchers.define :expose_float do |attribute|
  match do |klass|
    instance1 = klass.new({ attribute.to_sym => 123.45 })
    instance2 = klass.new({ attribute.to_sym => 123 })
    instance3 = klass.new({ attribute.to_sym => nil })
    instance1.send(attribute.to_sym) == 123.45 &&
      instance2.send(attribute.to_sym) == 123.0 &&
      instance3.send(attribute.to_sym) == 0.0
  end
end

RSpec::Matchers.define :expose_string do |attribute|
  match do |klass|
    instance = klass.new({ attribute.to_sym => "String value" })
    instance.send(attribute.to_sym) == "String value"
  end
end

RSpec::Matchers.define :expose_datetime do |attribute|
  match do |klass|
    date_str = "2014-09-12T10:22:37Z"
    parsed_date = DateTime.parse(date_str)
    instance = klass.new({ attribute.to_sym => date_str })
    instance.send(attribute.to_sym) == parsed_date
  end
end

