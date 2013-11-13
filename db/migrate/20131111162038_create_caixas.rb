class CreateCaixas < ActiveRecord::Migration
  def change
    create_table :caixas do |t|
      t.string :name

      t.timestamps
    end
  end
end
