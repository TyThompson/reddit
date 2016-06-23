class Board < ActiveRecord::Base
  validates :name, presence: true
  validates :mod_id, presence: true
  belongs_to :mod_id
  has_many :subjects


    # t.string :name
    # t.integer :mod_id
    #
    # t.timestamps null: false
end
