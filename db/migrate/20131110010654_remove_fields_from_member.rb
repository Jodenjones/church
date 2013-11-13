class RemoveFieldsFromMember < ActiveRecord::Migration
  def change
    remove_column :members,:name
    remove_column :members,:cpf
  end
end
