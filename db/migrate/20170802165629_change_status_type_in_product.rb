class ChangeStatusTypeInProduct < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :status, :string
  end
end
