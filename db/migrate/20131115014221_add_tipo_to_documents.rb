class AddTipoToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :tipo, :string, :size => 1, :default => 'R'
  end
end
