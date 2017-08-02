class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :no_of_stock
      t.integer :cost_of_product

      t.timestamps
    end
  end
end

