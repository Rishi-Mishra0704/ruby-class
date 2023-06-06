require_relative 'person'

class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(age, classroom = nil, parent_permission: true, name: 'Unknown')
    super(age, name)
    @classroom = classroom
    @parent_permission = parent_permission
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
