FactoryGirl.define do 

	factory :blog do
		content "This is my new factory blog"
		title { "Blog Title #{Random.rand(10000)}" }
	end

	factory :comment do
		content "This is my factory comment"
		blog
	end
	
end