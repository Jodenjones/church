class AddTipoToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :tipo , :integer
  end
end
