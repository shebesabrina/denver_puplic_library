require './test/test_helper'
require './lib/author'
require './lib/book'

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
end
