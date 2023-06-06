require 'rspec'
require 'date'
require_relative 'class/person'
require_relative 'class/rental'
require_relative 'class/book'
require_relative 'class/classroom'
require_relative 'class/teacher'
require_relative 'class/student'
RSpec.describe Person do
  let(:name) { 'John Doe' }
  let(:age) { 25 }
  let(:person) { Person.new(age, name) }

  describe '#initialize' do
    it 'sets the age, name, rentals, and generates an id' do
      expect(person.age).to eq(age)
      expect(person.name).to eq(name)
      expect(person.rentals).to be_an(Array)
      expect(person.rentals).to be_empty
      expect(person.id).to be_an(Integer)
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      let(:age) { 21 }

      it 'returns true' do
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when the person is underage but has parent permission' do
      let(:age) { 15 }
      before { person.instance_variable_set(:@parent_permission, true) }

      it 'returns true' do
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when the person is underage and does not have parent permission' do
      let(:age) { 15 }

      it 'returns false' do
        expect(person.can_use_services?).to be_falsey
      end
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq(name)
    end
  end

  describe '#rent' do
    let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
    let(:date) { Date.today }

    it 'creates a new Rental object' do
      rental = person.rent(book, date)
      expect(rental).to be_a(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
    end
  end

  describe '.create' do
    context 'when creating a teacher' do
      let(:teacher_name) { 'Jane Smith' }
      let(:teacher_age) { 35 }
      let(:teacher) { Person.create(teacher_name, teacher_age, 'teacher') }

      it 'returns an instance of Teacher' do
        expect(teacher).to be_a(Teacher)
        expect(teacher.name).to eq(teacher_name)
        expect(teacher.age).to eq(teacher_age)
      end
    end

    context 'when creating a student' do
      let(:student_name) { 'Bob Johnson' }
      let(:student_age) { 16 }
      let(:classroom) { Classroom.new('Math') }
      let(:student) { Person.create(student_name, student_age, 'student', nil, classroom) }

      it 'returns an instance of Student' do
        expect(student).to be_a(Student)
        expect(student.name).to eq(student_name)
        expect(student.age).to eq(student_age)
        expect(student.classroom).to eq(classroom)
        expect(student.parent_permission).to be_truthy
      end
    end
  end
end
