class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent(person, date)
    rental = Rental.new(person, self, date)
    @rentals << rental
    person.rentals << rental
    rental
  end
end
