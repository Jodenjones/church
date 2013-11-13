class AddTipoToMov < ActiveRecord::Migration
  def change
    add_column :movs, :tipo, :string, :size => 1
  end
  
end
