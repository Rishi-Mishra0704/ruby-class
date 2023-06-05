require 'json'

class StorePerson
  def initialize
    @data = load_data || []
  end

  def add_person(person)
    @data << person
    save_data
  end

  def view_persons
    @data
  end

  private

  def load_data
    return [] unless File.exist?('persons.json')

    file_content = File.read('persons.json').strip
    return [] if file_content.empty?

    begin
      JSON.parse(file_content)
    rescue JSON::ParserError => e
      puts "Error parsing 'persons.json' file: #{e.message}"
      []
    end
  end

  def save_data
    File.write('persons.json', JSON.pretty_generate(@data))
  end
end
