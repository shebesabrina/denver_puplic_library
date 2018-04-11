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
    @books << Book.new(title)
    @books << Book.new(date)
  end
end
