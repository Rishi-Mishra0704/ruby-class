require_relative '../class/teacher'

RSpec.describe Teacher do
  let(:age) { 35 }
  let(:specialization) { 'Mathematics' }
  let(:parent_permission) { true }
  let(:name) { 'John Doe' }

  describe '#initialize' do
    it 'sets the age, specialization, parent_permission, and name correctly' do
      teacher = Teacher.new(age, specialization, parent_permission: parent_permission, name: name)
      expect(teacher.age).to eq(age)
      expect(teacher.specialization).to eq(specialization)
      expect(teacher.parent_permission).to eq(parent_permission)
      expect(teacher.name).to eq(name)
    end

    it 'defaults the name to "Teacher" if not provided' do
      teacher = Teacher.new(age, specialization)
      expect(teacher.name).to eq('Teacher')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new(age, specialization)
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
