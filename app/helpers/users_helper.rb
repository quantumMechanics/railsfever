module UsersHelper

	def require_signed_in_user
		redirect_to signin_url, notice: 'Please Sign In.' unless signed_in?
	end

	def require_admin_user
		unless current_user().admin?
			flash[:error] = "Only admins can delete users"
			redirect_to users_url
		end
	end

end
