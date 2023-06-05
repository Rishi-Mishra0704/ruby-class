require_relative 'app'

class RentalApp
  def initialize
    @app = App.new
  end

  def run
    loop do
      display_menu

      choice = gets.chomp.to_i

      handle_choice(choice)

      break if choice == 7
    end

    puts 'Goodbye!'
  end

  private

  def display_menu
    puts 'Welcome to the Rental App!'
    puts 'Please choose an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
  end

  def handle_choice(choice)
    actions = {
      1 => method(:list_all_books),
      2 => method(:list_all_people),
      3 => method(:create_person),
      4 => method(:create_book),
      5 => method(:create_rental),
      6 => method(:list_rentals_for_person),
      7 => method(:quit)
    }

    action = actions[choice]
    if action
      action.call
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def list_all_books
    @app.list_all_books
  end

  def list_all_people
    @app.list_all_people
  end

  def create_person
    puts "Enter the person's name:"
    name = gets.chomp

    puts "Enter the person's age:"
    age = gets.chomp.to_i

    puts 'Do you want to create a student(1) or a teacher(2)? [input the number]'
    type = gets.chomp

    if type == '2'
      @app.create_person(name, age, 'teacher')
    elsif type == '1'
      puts "Enter the student's classroom:"
      classroom = gets.chomp
      @app.create_person(name, age, 'student', classroom)
    else
      puts 'Invalid person type!'
    end
  end

  def create_book
    puts "Enter the book's title:"
    title = gets.chomp

    puts "Enter the book's author:"
    author = gets.chomp

    @app.create_book(title, author)
  end

  def create_rental
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i

    puts "Enter the book's title:"
    book_title = gets.chomp

    puts 'Enter the rental date (YYYY-MM-DD):'
    rental_date = gets.chomp

    @app.create_rental(person_id, book_title, rental_date)
  end

  def list_rentals_for_person
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i

    @app.list_rentals_for_person(person_id)
  end

  def quit
    # No action needed
  end
end
