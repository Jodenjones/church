class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.date :venc
      t.decimal :valor
      t.integer :parceiro_id
      t.integer :conta_id
      t.string :sta

      t.timestamps
    end
  end
end
