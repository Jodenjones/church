class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :cpf
      t.date :entrada

      t.timestamps
    end
  end
end
