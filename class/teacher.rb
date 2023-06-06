require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :parent_permission

  def initialize(age, specialization, parent_permission: true, name: 'Teacher')
    super(age, name)
    @specialization = specialization
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end
