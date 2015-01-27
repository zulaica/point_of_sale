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
  #@product= one single product being created
  #:name refers to the Database table, product_name, points to User input
  #from form
  @products = Product.all()
  #@products, plural, all products in database
 erb(:index)
end

get('/products/:id') do
  @product = Product.find(params['id'].to_i())
  erb(:product)
  #naming convention for \views, much like class, is singular
end

patch('/products/:id') do
  product_name = params.fetch("product_name")
  product_amount = params.fetch("product_amount").to_f()
  @product = Product.find(params['id'].to_i())
  @product.update({:name => product_name, :amount => product_amount})
  erb(:product)
  #Database id not affected,only changes name and amount in database
end

delete('/products/:id') do
  @product = Product.find(params['id'].to_i())
  @product.delete()
  @products = Product.all()
  erb(:index)
  #When the id is deleted, it is not reassigned in the datbase in numberical order
  #E.G. is you delete id=3, id=3 is gone for good, never to be seen again.
end
