class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :introduction
      t.string :fee
      t.string :address

      t.timestamps
    end
  end
end
