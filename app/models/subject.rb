class Subject < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :board_id, presence: true
  belongs_to :board
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :votes, :dependent => :destroy


  # create_table :subjects do |t|
  #   t.integer :user_id
  #   t.string :title
  #   t.text :description
  #   t.integer :value
  #   t.integer :board_id
  #
  #   t.timestamps null: false
end
