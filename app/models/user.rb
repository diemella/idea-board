class User < ApplicationRecord
  # validations
  validates :email, presence: true, uniqueness: true

  # associations
  has_many :ideas, foreign_key: "creator_id"

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def authenticate(inputted_password)
    self.password == inputted_password
  end
end
