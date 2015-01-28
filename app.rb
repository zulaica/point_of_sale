require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('pg')
require('./lib/product')
require('./lib/purchase')

get '/' do
  @products = Product.all()
  erb(:index)
end

post('/products') do
  product_name = params.fetch("product_name")
  product_amount = params.fetch("product_amount").to_f()
  @product = Product.create({:name => product_name, :amount => product_amount})
  @products = Product.all()
  erb(:index)
end

get('/products/:id') do
  @product = Product.find(params['id'].to_i())
  erb(:product)
end

patch('/products/:id') do
  product_name = params.fetch("product_name")
  product_amount = params.fetch("product_amount").to_f()
  @product = Product.find(params['id'].to_i())
  @product.update({:name => product_name, :amount => product_amount})
  erb(:product)
end

delete('/products/:id') do
  @product = Product.find(params['id'].to_i())
  @product.delete()
  @products = Product.all()
  erb(:index)
end

get('/purchases') do
  @products = Product.all()
  erb(:purchase)
end

get('/purchases/:id')do

  erb(:purchase)
end

post('/purchases') do
  @purchase = Purchase.create()
  params['check'].each do |check|
    
  end
  erb(:purchase)
end
