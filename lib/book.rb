class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date

  def initialize(argument)
    @author_first_name = argument[:author_first_name]
    @author_last_name = argument[:author_last_name]
    @title = argument[:title]
    @publication_date = argument[:publication_date]
  end
end
