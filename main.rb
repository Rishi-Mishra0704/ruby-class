require_relative 'class/person'
require_relative 'class/student'
require_relative 'class/teacher'
require_relative 'class/capitalize_decorator'
require_relative 'class/trimmer_decorator'

person = Person.new(22, name: 'maximilianus')
puts "Person Name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Person Name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and Trimmed Person Name: #{capitalized_trimmed_person.correct_name}"

# Create a Person object
person = Person.new(25)
puts "Person ID: #{person.id}"
puts "Person Name: #{person.name}"
puts "Person Age: #{person.age}"
puts "Can Use Services? #{person.can_use_services?}"
person.name = 'John'
person.age = 30
puts "Person Name: #{person.name}"
puts "Person Age: #{person.age}"

# Create a Student object
student = Student.new(16, 'Classroom A')
puts "Student ID: #{student.id}"
puts "Student Name: #{student.name}"
puts "Student Age: #{student.age}"
puts "Can Use Services? #{student.can_use_services?}"
puts student.play_hooky

# Create a Teacher object
teacher = Teacher.new(40, 'Math')
puts "Teacher ID: #{teacher.id}"
puts "Teacher Name: #{teacher.name}"
puts "Teacher Age: #{teacher.age}"
puts "Can Use Services? #{teacher.can_use_services?}"
