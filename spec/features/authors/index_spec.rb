require 'rails_helper'

RSpec.describe "As a visitor" do
  it "anywhere I see an author's name, it is a link to their show page" do
    author_1 = Author.create(name: "Some Author")
    author_2 = Author.create(name: "Some Other Author")
    author_3 = Author.create(name: "Some Other Other Author")
    book_1 = Book.create(title: "Some Book", publication_year: "1987", pages: 357)
    book_2 = Book.create(title: "Some Other Book", publication_year: "1984", pages: 600)
    book_3 = Book.create(title: "Some Other Other Book", publication_year: "1974", pages: 560)

    book_1.authors << [author_1, author_2]
    book_2.authors << author_1
    book_3.authors << [author_2, author_3]

    visit '/books'

    click_link "#{author_1.name}"
    expect(current_path).to eq("/authors/#{author_1.id}")
  end
end
