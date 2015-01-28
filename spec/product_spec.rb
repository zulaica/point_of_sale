require("spec_helper")

describe('Product') do
  it('is featured in many purchases')do
    purchase = Purchase.create()
    product = Product.create({:purchases => [purchase]})
    expect(product.purchases()).to(eq([purchase]))
  end
end
