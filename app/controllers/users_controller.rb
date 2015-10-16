class UsersController < ApplicationController
	def about
		@about = User.find_by(name: "Kelly").about 
	end
end