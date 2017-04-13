class RemoveTypeFromGood < ActiveRecord::Migration[5.0]
  def change
    remove_column :goods, :type, :string
  end
end
