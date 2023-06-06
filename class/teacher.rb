require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :parent_permission

  def initialize(age, specialization, parent_permission: true, name: nil)
    super(age, parent_permission: parent_permission, name: name || 'Teacher')
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
