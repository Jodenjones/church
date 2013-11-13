class CreateFornecedors < ActiveRecord::Migration
  def change
    create_table :fornecedors do |t|
      t.integer :regime
      t.integer :tipo

      t.timestamps
    end
  end
end
