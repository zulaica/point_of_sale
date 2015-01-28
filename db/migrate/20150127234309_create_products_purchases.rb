class CreateProductsPurchases < ActiveRecord::Migration
  def change
    create_table(:products_purchases) do |t|
      t.column(:purchase_id, :int)
      t.column(:product_id, :int)
    end
  end
end
