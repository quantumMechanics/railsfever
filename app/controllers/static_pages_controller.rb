class StaticPagesController < ApplicationController
  
  def home
  	@new_lead = NewLead.new
  end

  #def faq
  #end

  def about
  end 

end
