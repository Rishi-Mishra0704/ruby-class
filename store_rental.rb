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
    return unless File.exist?('rentals.json')

    JSON.parse(File.read('rentals.json'))
  end

  def save_data
    File.write('rentals.json', JSON.generate(@data))
  end
end
