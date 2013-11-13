class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :birthday
      t.integer :city_id
      t.integer :user_id

      t.timestamps
    end
  end
end
