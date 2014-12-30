class NewLeadsController < ApplicationController

	def create
		@new_lead = NewLead.new(params[:new_lead])
		respond_to do |format|
			if @new_lead.valid?
				NewLeadMailer.new_message(@new_lead).deliver
				flash.now[:notice] = 'Thank you, we will be in touch shortly'
				#format.js {} 
				#flash.now[:notice] = "Thank you, we will be in touch shortly"
			else
				flash.now[:error] = "Please fill in all fields"
				format.js {}
			end
		end
	end

end
