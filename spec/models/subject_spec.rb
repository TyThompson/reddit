require 'rails_helper'

RSpec.describe Subject, type: :model do
  it "creates a subject" do
    subject = Subject.create!(user_id:1, title:"test title", description:"test subject description", value:0, board_id:1)

    expect(subject.description).to eq("test subject description")
  end
end
