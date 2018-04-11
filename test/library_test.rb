require './test/test_helper'
require './lib/library'
require './lib/author'
require './lib/book'

class LibraryTest < Minitest::Test
  attr_reader :dpl
  def setup
    @dpl = Library.new
  end

  def test_it_exists
    assert_instance_of Library, dpl
  end

  def test_books_starts_empty
    assert_equal [], dpl.books
  end

  def test_add_collection_of_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(villette)
    dpl.add_to_collection(mockingbird)

    assert_equal "Jane Eyre", jane_eyre.first.title
    assert_equal "Villette", villette[1].title
    assert_equal "July 11, 1960", mockingbird.last.publication_date
  end

  def test_the_collection_includes_the_book_attributes
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(villette)
    dpl.add_to_collection(mockingbird)

    assert_equal true, dpl.include?("To Kill a Mockingbird")
    assert_equal true, dpl.include?("Villette")
    assert_equal true, dpl.include?("Jane Eyre")
    assert_equal false, dpl.include?("Harry Potter")
  end

  def test_collection_can_be_sorted
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(villette)
    dpl.add_to_collection(mockingbird)

    assert_equal "Bronte", dpl.card_catalogue.first.author_last_name
  end
end
