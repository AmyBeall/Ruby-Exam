class User < ActiveRecord::Base
	has_many :ideas
	has_many :likes

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, :alias, presence: true, length: {in: 2..20}
	validates :password, confirmation: true, presence: true, length: {in: 8..20}
	validates :email, presence: :true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


	def self.authenticate(email, password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.password == password
	end	
end
