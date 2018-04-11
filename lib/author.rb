class Author
  attr_reader :first_name,
              :last_name

  def initialize(argument)
    @first_name = argument[:first_name]
    @last_name = argument[:last_name]
  end
end
