class RemoveTypeFromAccount < ActiveRecord::Migration
  def change
    remove_column :accounts, :type
  end
end
