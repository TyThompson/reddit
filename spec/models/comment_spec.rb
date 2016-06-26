require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "creates a comment" do
    comment = Comment.create!(user_id:1, description:"test comment", value:0, subject_id:1)

    expect(comment.description).to eq("test comment")
  end
end
