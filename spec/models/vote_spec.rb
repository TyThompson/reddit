require 'rails_helper'

RSpec.describe Vote, type: :model do
  it "creates a vote" do
    vote = Vote.create!(user_id:1, value:1, subject_id:1)

    expect(vote.value).to eq(1)
  end
end
