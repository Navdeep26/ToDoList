class AddFeatureToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :feature, :string
  end
end
