class UsersController < ApplicationController
	before_filter :require_signed_in_user, only: [:edit, :update, :index, :destroy]
	before_filter :require_correct_user, only: [:edit, :update]
	before_filter :require_admin_user, only: [:destroy]
	
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def index
		@users = User.paginate(page: params[:page])
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Rails Fever"
			redirect_to blogs_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update_attributes(params[:user])
			flash[:success] = 'Profile Updated'
			sign_in @user
			redirect_to blogs_path
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted!"
		redirect_to users_url
	end

	private
		
		def require_correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end

end
