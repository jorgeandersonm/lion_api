class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.string :name,   													null: false, default: ""
      t.string :type,    													null: false, default: ""
      t.decimal :value, precision: 12, scale: 2,  null: false, default: 0.0
      t.integer :individual_id,                   null: false, foreign_key: true

      t.timestamps
    end
  end
end
