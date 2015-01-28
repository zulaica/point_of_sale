require("spec_helper")

describe('Purchase') do
  it("has many products") do
    product = Product.create({:name => "asdf", :amount => 25.5})
    purchase = Purchase.create({:products => [product]})
    expect(purchase.products()).to(eq([product]))
  end
end
