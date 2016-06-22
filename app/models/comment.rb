class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :text, presence: true
  validates :subject_id, presence: true
  belongs_to :user


  # create_table :comments do |t|
  #   t.integer :user_id
  #   t.text :description
  #   t.integer :value
  #   t.integer :subject_id
  #
  #   t.timestamps null: false
end
