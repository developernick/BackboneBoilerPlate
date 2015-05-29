require 'bundler'
Bundler.require()

Dotenv.load
set :publishable_key, ENV['PUBLISHABLE_KEY']
set :secret_key, ENV['SECRET_KEY']


get '/' do
  erb :index
end

post '/charge' do
  @amount = 1000

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
  :amount => @amount,
  :currency => 'usd'
  )
end
