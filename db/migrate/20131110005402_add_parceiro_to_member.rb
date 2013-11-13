class AddParceiroToMember < ActiveRecord::Migration
  def change
    add_column :members,:parceiro_id, :integer
  end
end
