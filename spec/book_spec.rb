require 'rspec'
require_relative '../class/book'
require 'date'
require_relative '../class/rental'

RSpec.describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(title, author) }

  describe '#initialize' do
    it 'sets the title and author correctly' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#rent' do
    let(:person) { double('Person', rentals: []) }
    let(:date) { Date.today }

    it 'creates a new Rental object' do
      rental = book.rent(person, date)
      expect(rental).to be_a(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
    end
  end

  describe '.create' do
    it 'creates a new Book object' do
      new_book = Book.create(title, author)
      expect(new_book).to be_a(Book)
      expect(new_book.title).to eq(title)
      expect(new_book.author).to eq(author)
      expect(new_book.rentals).to be_an(Array)
      expect(new_book.rentals).to be_empty
    end
  end
end
