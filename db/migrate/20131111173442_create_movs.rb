class CreateMovs < ActiveRecord::Migration
  def change
    create_table :movs do |t|
      t.date :data
      t.decimal :valor
      t.integer :document_id
      t.integer :caixa_id
      t.integer :conta_id

      t.timestamps
    end
  end
end
