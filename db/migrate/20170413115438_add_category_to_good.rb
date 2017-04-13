class AddCategoryToGood < ActiveRecord::Migration[5.0]
  def change
    add_column :goods, :category, :string, null: false, default: ""
  end
end
