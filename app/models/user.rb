class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, with: /@/
  validates :password_digest, presence: true
end
