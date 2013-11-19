class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :service_id
      t.decimal :valor

      t.timestamps
    end
  end
end
