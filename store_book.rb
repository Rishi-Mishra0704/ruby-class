require 'json'

class StoreBook
  def initialize
    @data = load_data || []
  end

  def add_book(book)
    @data << book
    save_data
  end

  def view_book
    @data
  end

  private

  def load_data
    return [] unless File.exist?('books.json')

    file_content = File.read('books.json').strip
    return [] if file_content.empty?

    begin
      JSON.parse(file_content)
    rescue JSON::ParserError => e
      puts "Error parsing 'books.json' file: #{e.message}"
      []
    end
  end

  def save_data
    File.write('books.json', JSON.generate(@data))
  end
end
