class Vote < ActiveRecord::Base
  validates :user_id, presence: true
  validates :value, presence: true
  belongs_to :user

  # create_table :votes do |t|
  #   t.integer :user_id
  #   t.integer :value
  #   t.integer :subject_id
  #   t.integer :comment_id
  #
  #   t.timestamps null: false
end
