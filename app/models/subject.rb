class Subject < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :board_id, presence: true
  belongs_to :user



  # create_table :subjects do |t|
  #   t.integer :user_id
  #   t.string :title
  #   t.text :description
  #   t.integer :value
  #   t.integer :board_id
  #
  #   t.timestamps null: false
end
