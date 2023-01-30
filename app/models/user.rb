class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      # returns an instance of the user
      user
    else
      nil
    end

  end
  
end
