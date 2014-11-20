require 'sinatra'
require 'printfection'
require 'logger'
Logger.class_eval { alias :write :'<<' }

$logger = ::Logger.new(STDOUT)

PF = Printfection
PF.api_token = ENV['PRINTFECTION_API_TOKEN']
PF.logger = $logger

class App < Sinatra::Base
  use Rack::MethodOverride

  configure do
    use Rack::CommonLogger, $logger
  end

  get "/" do
    @orders = PF::Order.all limit: 5
    @campaigns = PF::Campaign.all
    erb :dashboard
  end

  get "/orders" do
    @orders = PF::Order.all
    erb :orders
  end

  get "/orders/:id" do
    @order = PF::Order.retrieve(params[:id])
    erb :order
  end

  get "/campaigns/:id" do
    @campaign = PF::Campaign.retrieve(params[:id])
    erb :campaign
  end
end

