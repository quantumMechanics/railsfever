class NewLeadMailer < ActionMailer::Base

  default from: "customer@#{ENV['DOMAIN']}"
  default to: ENV['MAIL_USERNAME']

  def new_message(message)
  	@message = message
  	mail(subject: "New Lead")
  end
  
end
