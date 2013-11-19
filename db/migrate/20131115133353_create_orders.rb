class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :fornecedor_id
      t.decimal :total
      t.text :obs

      t.timestamps
    end
  end
end
