require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    subject{
      @user = User.create(
        name: 'Test',
        email: 'test@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
    }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      subject.password_confirmation = 'test456'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid if password and password_confirmation are empty' do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end
    
  end
end
