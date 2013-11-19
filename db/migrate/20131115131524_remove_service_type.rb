class RemoveServiceType < ActiveRecord::Migration
  def change
    drop_table :service_types
  end
end
