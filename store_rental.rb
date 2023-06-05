require 'json'
class StoreRental
  def initialize
    @data = load_data || []
  end

  def add_rental(rental)
    @data << rental
    save_data
  end

  def view_rentals
    @data
  end

  private

  def load_data
    return [] unless File.exist?('rentals.json')

    file_content = File.read('rentals.json').strip
    return [] if file_content.empty?

    begin
      JSON.parse(file_content)
    rescue JSON::ParserError => e
      puts "Error parsing 'rentals.json' file: #{e.message}"
      []
    end
  end

  def save_data
    File.write('rentals.json', JSON.pretty_generate(@data))
  end
end
