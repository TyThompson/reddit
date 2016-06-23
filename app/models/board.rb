class Board < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_many :subjects, :dependent => :destroy

    # t.string :name
    # t.integer :mod_id
    #
    # t.timestamps null: false
end
