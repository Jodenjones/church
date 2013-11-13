class RemoveTipoFromAccount < ActiveRecord::Migration
  def change
    remove_column :accounts, :tipo
    add_column :accounts, :tipo, :string, :size => 1
  end
end
