require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "I see a navigation bar" do
    it "which includes links which allow you to return to the home page of the application and a link to all books" do
      visit "/"

      expect(page).to have_content("Welcome to Book Club!")

      within "nav" do
        expect(page).to have_link("Home")
        expect(page).to have_link("All Books")
      end

      click_link "Home"
      expect(current_path).to eq("/")

      click_link "All Books"
      expect(current_path).to eq("/books")
    end
  end
end
