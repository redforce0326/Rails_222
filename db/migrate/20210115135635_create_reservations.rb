class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :total_amount
      t.string :people

      t.timestamps
    end
  end
end
