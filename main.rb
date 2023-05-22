require_relative 'class/person'
require_relative 'class/student'
require_relative 'class/teacher'

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
