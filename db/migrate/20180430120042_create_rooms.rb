class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name, limit: 150
      t.string :key, null: false, limit: 100, unique: true
      t.references :user, null: false
      t.timestamps
    end
    add_index :rooms, :key, unique: true
  end
end
