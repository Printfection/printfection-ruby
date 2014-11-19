# Printfection Ruby API [![Build Status](https://travis-ci.org/Printfection/printfection-ruby.png?branch=prerelease)](https://travis-ci.org/Printfection/printfection-ruby) [![Code Climate](https://codeclimate.com/github/Printfection/printfection-ruby/badges/gpa.svg)](https://codeclimate.com/github/Printfection/printfection-ruby) [![Test Coverage](https://codeclimate.com/github/Printfection/printfection-ruby/badges/coverage.svg)](https://codeclimate.com/github/Printfection/printfection-ruby)

Implementation of the [Printfection API](http://printfection.github.io/API-Documentation) for Ruby.

At a high level, the Printfection API can be used to create, modify, place, and cancel orders. `Orders` are made up of a set of line items and a shipping address, but orders also expose detailed information about their products, sizes, images, quantities, and availability.

`Campaigns` are logical groups of items used to organize your orders. All orders are always associated to exactly one campaign, and only items associated to a given campaign can be placed in an order in the same campaign. For example, your company's marketing department might have a Giveaway campaign with coffee mugs to reward loyal customers, and your engineering department might have a Purchase campaign with nerdy swag to outfit new hires. Some campaigns have special properties. Orders in `giveaway` and `freeforall` campaigns have a code and a web URL that can be used to redeem an order. A common use case for these campaigns is <some use case>. [Learn more about campaigns](http://printfection.com) or [view the Campaign object reference](http://printfection.github.io/API-Documentation/#campaigns)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'printfection'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install printfection


## Usage

First, configure your API token. This can be found in your account on [printfection.com](http://printfection.com).

```ruby
require "printfection"

Printfection.api_token = "e3ce1ddf152d5533ca4a3d3543006bac6d57b2ac"
```

If you're using Rails, `config/initializers/printfection.rb` is a good place for this.

### Creating an order

At a minimum, a new order can be created with just a `campaign_id`:

```ruby
order = Printfection::Order.create(campaign_id: 1)
  #=> #<Printfection::Order id: 1, campaign_id: 1>
```

Once you have created an order, you can then begin adding line items. A line item requires an `item_id`, `quantity`, and a `size_id` if the item has sizes.

```ruby
# Creating a line item with a size.
order.line_items.create(
  item_id: 1,
  size_id: 2,
  quantity: 3
)
  #=> #<Printfection::LineItem id: 1, order_id: 1, item_id: 1, size_id: 2, quantity: 3>

# Creating a line item without a size.
order.line_items.create(
  item_id: 2,
  quantity: 6
)
  #=> #<Printfection::LineItem id: 2, order_id: 1, item_id: 2, quantity: 6>

```

You can retrieve existing line items to update them:

```ruby
line_item = order.line_items.retrieve(1)
  #=> #<Printfection::LineItem id: 1, order_id: 1, item_id: 1, quantity: 3>

line_item.quantity = 12
line_item.save
  #=> true

line_item.quantity
  #=> 12
```

And delete them:

```ruby
line_item = order.line_items.retrieve(2)
  #=> #<Printfection::LineItem id: 2, order_id: 1, item_id: 2, quantity: 6>

line_item.delete
  #=> true
```

Provide a shipping address for the order.

```ruby
order = Printfection::Order.retrieve(1)
  #=> #<Printfection::Order id: 1 ...>

order.ship_to = {
  name: "Joseph Schmo",
  address: "123 Main Street",
  address2: "Suite 101",
  company: "ACME Inc.",
  city: "Denver",
  state: "Colorado",
  zip: "80202",
  country: "United States"
}

order.save
  #=> true
```

Whoops, that should be shipped to Sally.

```ruby
order.ship_to.name = "Sally Schmo"
order.save
  #=> true
```

Finally, when you are finished building the order, place it:

```ruby
order = Printfection::Order.retrieve(1)
order.place
  #=> true
```

Or cancel it:

```ruby
order = Printfection::Order.retrieve(1)
order.cancel
  #=> true
```


### Retrieving an item

```ruby
item = Printfection::Item.retrieve(1)
  #=> #<Printfection::Item id: 1 ...>

item.name #=> "My Awesome T-Shirt"
item.color #=> "Green"
item.product.name #=> "American Apparel 50/50 T-Shirt"

item.campaigns
  #=> [#<Printfection::Campaign id: 1 ...>, #<Printfection::Campaign id: 2 ...>]

item.sizes
  #=> [#<Printfection::Size id: 1 ...>, #<Printfection::Size id: 2 ...>]

item.images
  #=> [#<Printfection::Image id: 1 ...>, #<Printfection::Image id: 2 ...>]

```

### Listing all items

```ruby
items = Printfection::Items.all
  #=> [#<Printfection::Item id: 1 ...>, #<Printfection::Item id: 2 ...>]
```

### Retrieving a campaign

```ruby
campaign = Printfection::Campaign.retrieve(1)
  #=> #<Printfection::Campaign id: 1 ...>

campaign.name #=> "My Awesome T-Shirt"
campaign.type #=> "giveaway"
campaign.name #=> "My Awesome Giveaway Campaign"
campaign.active #=> true

```

### Listing all campaigns

```ruby
campaigns = Printfection::Campaign.all
  #=> [#<Printfection::Campaign id: 1 ...>, #<Printfection::Campaign id: 2 ...>]
```

Printfection objects expose all JSON data from the API responses as accessor methods. The full API documentation can be [found here](http://printfection.github.io/API-Documentation).

For additional examples, check out out the [examples directory](examples).

## Errors

Our API bindings can raise exceptions for many reasons, such as a trying to place an incomplete order, invalid parameters, authentication errors, and network unavailability.

Most API errors are captured and raised as a `Printfection::Error`. This makes it easy to gracefully handle exceptions.

```ruby
begin
  order = Printfection::Order.create(campaign_id: 1)
  # This order does not have any line items and
  # does not have a shipping address,
  # so trying to place this order will raise.
  order.place
rescue Printfection::Error => e
  # Something went wrong placing this order.
  puts e.message
rescue StandardError => e
  # Something else went wrong.
  puts e.message
end
```

## License

[MIT](LICENCE.txt)

## Issues & Support

[casey.ohara@printfection.com](mailto:casey.ohara@printfection.com)

## Contributing

1. Fork it ( https://github.com/printfection/printfection-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

