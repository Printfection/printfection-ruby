require 'sinatra'
require 'printfection'

PF = Printfection

get "/" do
  redirect to('/orders')
end

get "/orders" do
  erb :orders
end

