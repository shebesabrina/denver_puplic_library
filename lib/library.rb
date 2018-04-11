class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(title)
    @books << title
  end

  def include?(title)
    @books.flatten.any? do |book|
      book.title == title
    end
  end

  def card_catalogue
    @books.max_by do |book|
      book.first.author_last_name.length
    end
  end
end
