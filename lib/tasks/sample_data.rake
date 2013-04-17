namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    40.times do
      title = Faker::Lorem.sentence(8)
      content = Faker::Lorem.paragraph(10)
      b=Blog.new(title: title, content: content)
      b.save
    end
  end
end