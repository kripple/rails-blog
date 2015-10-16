class User < ActiveRecord::Base
	has_secure_password

	validates :name, :about, :presence => true
  validates :name, :uniqueness => true
end
