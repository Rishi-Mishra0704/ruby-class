require 'rspec'
require 'date'
require_relative '../class/rental'
require_relative '../class/book'
require_relative '../class/person'

RSpec.describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new('John Doe', 25) }
  let(:date) { Date.today }
  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'sets the date, book, and person correctly' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book and person rentals' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
