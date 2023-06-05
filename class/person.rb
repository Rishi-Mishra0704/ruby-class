require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent(book, date)
    Rental.new(date, book, self)
  end

  def self.create(name, age, type, specialization = nil, classroom = nil)
    case type
    when 'teacher'
      Teacher.new(age, specialization, name)
    when 'student'
      Student.new(age, classroom, parent_permission: true, name: name)
    end
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1000..9999)
  end
end
