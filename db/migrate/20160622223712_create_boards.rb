class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :mod_id

      t.timestamps null: false
    end
  end
end
