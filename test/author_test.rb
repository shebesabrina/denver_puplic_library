require './test/test_helper'
require './lib/author'
require './lib/book'
require './lib/library'

class AuthorTest < Minitest::Test
  attr_reader :charlotte_bronte
  def setup
    @charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, charlotte_bronte
  end

  def test_it_has_attributes
    assert_equal "Charlotte", charlotte_bronte.first_name
    assert_equal "Bronte", charlotte_bronte.last_name
  end

  def test_books_starts_empty
    assert_equal [], charlotte_bronte.books
  end

  def test_add_books_to_array
    result = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    assert_equal "Jane Eyre", result.first.title
  end

  def test_it_can_add_another_book_to_array
    result = charlotte_bronte.add_book("Villette", "1853")
    assert_equal "Villette", result.first.title
  end

  def test_both_books_are_in_array
   jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
   villette  = charlotte_bronte.add_book("Villette", "1853")

   assert_equal "Jane Eyre", jane_eyre.first.title
   assert_equal "Villette", villette.last.title
  end
end
