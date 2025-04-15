require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'returns the full_name for a student' do
    student = Student.create(first_name: 'Brad', last_name: 'Swag')
    expect(student.full_name).to eq 'Brad Swag'
  end
end
