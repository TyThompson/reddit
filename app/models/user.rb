class User < ActiveRecord::Base
  validates :name, presence: true
  validates :is_admin, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_many :comments
  has_many :subjects
  has_many :votes
  has_many :boards

  # t.string :name
  # t.boolean :is_admin
  # t.string :email
  # t.string :password
  #
  # t.timestamps null: false
end
