class AddParceiroIdToFornecedor < ActiveRecord::Migration
  def change
    add_column :fornecedors, :parceiro_id, :integer
  end
end
