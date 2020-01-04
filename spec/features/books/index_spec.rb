require 'rails_helper'

RSpec.describe "As a visitor" do
  it "anywhere I see a book title (with the exception of that book's show page) I can click on the book title to be taken to that book's show page" do
    book_1 = Book.create(title: "Some Book", publication_year: "1987", pages: 357)
    book_2 = Book.create(title: "Some Other Book", publication_year: "1984", pages: 600)

    visit '/books'

    within "#book-#{book_1.id}" do
      click_link "#{book_1.title}"
      expect(current_path).to eq("/books/#{book_1.id}")
    end

    visit '/books'

    within "#book-#{book_2.id}" do
      click_link "#{book_2.title}"
      expect(current_path).to eq("/books/#{book_2.id}")
    end
  end
end
