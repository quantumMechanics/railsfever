require "spec_helper"

describe ContactUsMailer do
  
  before { @message = Message.new({ first_name:'john',last_name:'doe', tel:'7185555555', 
  	email:'john@doe.com', subject:'We need your services', 
  	body:'We want you to build our web app immidiately. We are ready with our content!'}) 
  }

  subject { @message }

  it { should respond_to :first_name, :last_name, :subject, :email, :tel, :body, :first_name=,
  			:last_name=, :subject=, :email=, :tel=, :body= }

  it { should be_valid }

  describe "when all fields are empty" do
  	before { @message.first_name=" ", @message.last_name=" ", @message.tel=" ",
  			@message.email=" ", @message.subject=" ",  @message.body=" " }
  	it { should_not be_valid }
  end
 
  describe "when all values are nil" do 
  	it "should not be valid" do
  		m = Message.new()
  		m.should_not be_valid
  	end
  end

  describe "when first name is too long" do
  	before { @message.first_name="f" * 31}
  	it { should_not be_valid }
  end

  describe "when last name is too long" do
  	before { @message.last_name="l" * 31 }
  	it {should_not be_valid}
  end

  describe "when email is not correct format" do
  	it "should be invalid" do
	  	addresses = %w[user@foo,com user_at_foo.org example.user@foo.
	  		foo@bar_baz.com foo@bar+baz.com]
	    addresses.each do |a| 
	    	@message.email=a
	    	@message.should_not be_valid
	    end
	end
  end

  describe "when email is correct format" do
  	it "should be valid" do
	  	addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	  	addresses.each do |a|
	  		@message.email=a
	  		@message.should be_valid
	  	end
	end
  end

  describe "when tel is too long" do
  	before { @message.tel = "2" * 21 }
  	it {should_not be_valid}
  end

  describe "when subject is too long" do
  	before { @message.subject= 's' * 51 }
  	it { should_not be_valid }
  end

  describe "when body is too long" do
  	before { @message.body = "s" * 991 }
  	it { should_not be_valid }
  end

end
