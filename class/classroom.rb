class Classroom
  attr_accessor :label, :students, :classroom

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    students << student
    student.classroom = self
  end
end
