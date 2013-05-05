
namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do

  	User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    rfvr = User.create!(name: "Rails Fever",
                 email: "admin@railsfever.com",
                 password: "jcrew1",
                 password_confirmation: "jcrew1")
    rfvr.toggle!(:admin)

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  
    40.times do
      title = Faker::Lorem.sentence(8)
      content = Faker::Lorem.paragraph(60)
      b=Blog.new(title: title, content: content)
      b.save
    end

    blogs = Blog.all(limit: 20)
    2.times do
      content = Faker::Lorem.sentence(5)
      blogs.each { |b| b.comments.create!(content: content) }
    end 

    #create a lot of comments for one blog to get pagination
     blog40 = Blog.find_by_id(40)
     50.times do
        content = Faker::Lorem.sentence(8)
        blog40.comments.create!(content: content)
     end

  end
end