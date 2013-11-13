class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string  :name
      t.string  :type, :size => 1

      t.timestamps
    end
  end
end
