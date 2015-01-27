class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.column(:name, :string)
      t.column(:amount, :float)
    end
  end
end
