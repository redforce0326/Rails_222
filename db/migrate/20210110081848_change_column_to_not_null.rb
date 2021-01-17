class ChangeColumnToNotNull < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :profile,:text, null: true 
  end

  def down
    change_column :users, :profile,:text, null: false
  end
end
