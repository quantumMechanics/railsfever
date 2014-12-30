class NewLead

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :name, :email

	validates :name, :email, presence: true
   
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }


	def initialize( attributes = {} )
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end

	def persisted?
		false
	end

end