class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.belongs_to :guest, null: false, foreign_key: true
      t.belongs_to :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
