class User < ApplicationRecord
	before_save { self.email = email.downcase }
	has_many :articles
	validates :username, presence: true,
		uniqueness: { case_sensitive: false },
		length: {minimum: 3,maximum: 20 }
	VALID_EMAIL = /\A[\w.+-]+@\w+\.\w+\z/
	validates :email, presence: true,
		uniqueness: { case_sensitive: false },
		length: { maximum: 150 },
		format: { with: VALID_EMAIL }
	has_secure_password
end
