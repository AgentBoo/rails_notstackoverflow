class User < ApplicationRecord
  has_secure_password
  validates            :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  before_validation    :downcase_email


  private
  def downcase_email
    email.downcase if email
  end
end
