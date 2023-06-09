require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent(person, date)
    Rental.new(date, self, person)
  end

  def self.create(title, author)
    Book.new(title, author)
  end
end
