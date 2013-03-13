class ContactUsMailer < ActionMailer::Base
  
  default to: ENV['MAIL_USERNAME']

  def new_message(message)
  	@message = message
  	mail(subject: "#{message.subject}", from:"#{message.from}" )
  end
  
end
