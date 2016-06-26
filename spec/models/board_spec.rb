require 'rails_helper'

RSpec.describe Board, type: :model do
  it "creates a board" do
    board = Board.create!(name: "Board1", mod_id:1)

    expect(board.name).to eq("Board1")
  end
end
