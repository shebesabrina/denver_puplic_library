class Author
  attr_reader :first_name,
              :last_name,
              :books

  def initialize(argument)
    @first_name = argument[:first_name]
    @last_name = argument[:last_name]
    @books = []
  end

  def add_book(title, date)
    book_collection = {
      author_first_name: first_name,
      author_last_name: last_name,
      publication_date: date,
      title: title}
    @books << Book.new(book_collection)
  end
end
