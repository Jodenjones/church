class RemoveContaIdFromDocument < ActiveRecord::Migration
  def change
    remove_column :documents, :conta_id
    add_column :documents, :account_id, :integer
  end
end
