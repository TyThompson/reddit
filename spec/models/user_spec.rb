require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates a user" do
    joe = User.create!(:email => "jdoe@doe.co", :password => "secret")

    expect(joe.email).to eq("jdoe@doe.co")
  end
end

RSpec.describe "home page", :type => :request do
  it "displays the success message after successful login" do
    user = User.create!(:email => "jdoe@doe.co", :password => "secret")
    get "/users/sign_in"

    def document_root_element
      html_document.root
    end

    post "/users/sign_in", :email => "jdoe@doe.co", :password => "secret"
    assert_select "h3", :text => "Reddit"
  end
end
