FactoryGirl.define do 

	factory :blog do
		content "This is my new factory blog"
		title { Faker::Lorem.sentence(8) }
		visible true
	end

	factory :comment do
		content "This is my factory comment"
		blog
	end
	
end