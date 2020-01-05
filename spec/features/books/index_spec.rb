require 'rails_helper'

RSpec.describe "As a visitor" do
  it "when I visit a books index page, I see all book titles and each book's authors, number of pages, and the publication year" do
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

    within "#book-#{book_1.id}" do
      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.publication_year)
      expect(page).to have_content(book_1.pages)
      expect(page).to have_content(book_1.authors.name)
    end

    within "#book-#{book_2.id}" do
      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_2.publication_year)
      expect(page).to have_content(book_2.pages)
      expect(page).to have_content(book_2.authors.name)
    end

    within "#book-#{book_3.id}" do
      expect(page).to have_content(book_3.title)
      expect(page).to have_content(book_3.publication_year)
      expect(page).to have_content(book_3.pages)
      expect(page).to have_content(book_3.authors.name)
    end
  end

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

    within "#book-#{book_1.id}" do
      within "#author-#{author_1.id}" do
        click_link "#{author_1.name}"
        expect(current_path).to eq("/authors/#{author_1.id}")
      end
      # try and figure out how to test multiple within statements inside book within block. Can it be done? Will I forget to ask?
    end
  end
end
