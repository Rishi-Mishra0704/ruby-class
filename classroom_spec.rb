require 'rspec'
require_relative 'class/classroom'
require_relative 'class/student'
RSpec.describe Classroom do
  let(:classroom) { Classroom.new("Math") }
  let(:student) { Student.new("John", true) }

  describe "#initialize" do
    it "sets the label and initializes an empty students array" do
      expect(classroom.label).to eq("Math")
      expect(classroom.students).to be_empty
    end
  end

  describe "#add_student" do
    it "adds a student to the classroom and sets the student's classroom" do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
