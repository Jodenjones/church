class AddDtlancToMov < ActiveRecord::Migration
  def change
    add_column :movs, :dtlanc, :datetime
    remove_column :movs, :data
  end
end
