class CreateParceiros < ActiveRecord::Migration
  def change
    create_table :parceiros do |t|
      t.string :name
      t.string :cpf

      t.timestamps
    end
  end
end
