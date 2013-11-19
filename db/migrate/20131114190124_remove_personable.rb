class RemovePersonable < ActiveRecord::Migration
  def change
    remove_column :parceiros, :personable_id
    remove_column :parceiros, :personable_type
    add_column :members, :parceiro_id, :integer
    add_column :fornecedors, :parceiro_id, :integer
  end
end
