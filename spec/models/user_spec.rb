require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    subject{
      @user = User.create(
        first_name: 'Test',
        last_name: 'Ing',
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

    it 'is not valid if emails are not unique (not case sensitive)' do
      original_user = subject
      case_sensitive_user = User.create(
        first_name: 'Test',
        last_name: 'Ing',
        email: 'TEST@TEST.COM',
        password: 'test123',
        password_confirmation: 'test123'
      )
      expect(case_sensitive_user).to_not be_valid
      expect(case_sensitive_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid if email is empty' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid if first name is empty' do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid if last name is empty' do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid if password length is less than 6' do
      subject.password = "12345"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
  end
end
