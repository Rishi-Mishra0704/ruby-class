require 'rspec'
require_relative '../class/person'
require_relative '../class/student'
require_relative '../class/classroom'

RSpec.describe Student do
  let(:age) { 15 }
  let(:classroom) { Classroom.new('Physics') }
  let(:parent_permission) { true }
  let(:name) { 'John Doe' }
  let(:student) { Student.new(age, classroom, parent_permission: parent_permission, name: name) }

  describe '#initialize' do
    it 'sets the age, classroom, parent_permission, and name correctly' do
      expect(student.age).to eq(age)
      expect(student.classroom).to eq(classroom)
      expect(student.parent_permission).to eq(parent_permission)
      expect(student.name).to eq(name)
    end

    it 'adds the student to the classroom' do
      expect(classroom.students).to include(student)
    end

    context 'when classroom is nil' do
      let(:classroom) { nil }

      it 'does not raise an error' do
        expect { student }.not_to raise_error
      end
    end
  end

  describe '#play_hooky' do
    it 'returns the correct message' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
