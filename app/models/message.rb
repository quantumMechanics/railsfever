class Message

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming


attr_accessor :first_name, :last_name, :tel, :email, :subject, :body

	validates :first_name, :last_name, :tel, :email, :body, presence: true
  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 30 }
  validates :tel, length: { maximum: 20 }
  validates :subject, length: { maximum: 50 }
  validates :body, length: { maximum: 990 }
	 
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