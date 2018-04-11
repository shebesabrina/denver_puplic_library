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
    result_1 = dpl.add_to_collection(jane_eyre)
    result_2 = dpl.add_to_collection(villette)
    result_3 = dpl.add_to_collection(mockingbird)

    assert_equal "Jane Eyre", result_1.flatten.first.title
    assert_equal "Villette", result_2.flatten[1].title
    assert_equal "July 11, 1960", result_3.flatten.last.publication_date
  end
end
