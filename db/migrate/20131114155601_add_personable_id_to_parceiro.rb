class AddPersonableIdToParceiro < ActiveRecord::Migration
  def change
    add_column :parceiros, :personable_id, :integer
    add_column :parceiros, :personable_type, :string
    remove_column :members, :parceiro_id
    remove_column :fornecedors, :parceiro_id
  end
end
