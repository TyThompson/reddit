class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :value
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
