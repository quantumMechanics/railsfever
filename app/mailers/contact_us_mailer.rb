class ContactUsMailer < ActionMailer::Base
  #default from: "from@example.com"
  #default to: "genius@railsfever.dev"

  def new_message(message)
  	@message = message
  	mail(subject: "#{message.subject}")
  end
  
end
