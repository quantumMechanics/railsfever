FactoryGirl.define do 

	factory :blog do
		content "This is my new factory blog"
	end

	factory :comment do
		content "This is my factory comment"
		blog
	end
	
end