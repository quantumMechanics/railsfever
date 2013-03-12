class ContactUsController < ApplicationController

	def new 
		@message = Message.new
	end

	def create
		@message = Message.new(params[:message])

		if @message.valid?
			ContactUsMailer.new_message(@message).deliver
			#flash.now[:notice] = "Message was successfully sent"
			redirect_to(root_path)
		else
			flash.now[:error] = "Please fill in all fields"
			render :new
		end
	end

end
