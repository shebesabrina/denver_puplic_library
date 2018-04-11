require './test/test_helper'
require './lib/author'

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
end
