module SessionsHelper
	def log_in(user, isFirstParty)
		session[:user] = {:user_id => user.id, :is_first_party => isFirstParty}
	end

	def flash_login
		flash[:notice] = "Sign in successful!"
	end

	def flash_logout
		flash[:notice] = "Logged out."
	end

	def go_home
		redirect_to root_path
	end
end