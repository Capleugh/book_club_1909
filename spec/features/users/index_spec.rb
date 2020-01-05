require 'rails_helper'

RSpec.describe "As a visitor" do
  it "anywhere I see a user's name on the site for a book review, it is a link to that user's show page" do
    user_1 = User.create(name: "Ralph Fiennes")
    user_2 = User.create(name: "David Kurle")

    visit "/users"

    click_link "Ralph Fiennes"
    expect(current_path).to eq("/users/#{user_1.id}")

    visit "/users"

    click_link "David Kurle"
    expect(current_path).to eq("/users/#{user_2.id}")
  end
end
