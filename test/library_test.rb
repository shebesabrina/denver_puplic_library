require './test/test_helper'
require './lib/library'

class LibraryTest < Minitest::Test
  attr_reader :dpl
  def setup
    @dpl = Library.new
  end

  def test_it_exists
    assert_instance_of Library, dpl
  end
end
