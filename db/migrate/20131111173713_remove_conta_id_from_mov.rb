class RemoveContaIdFromMov < ActiveRecord::Migration
  def change
    remove_column :movs, :conta_id
    add_column :movs, :account_id, :integer
  end
end
