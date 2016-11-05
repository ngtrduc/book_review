User.create(name: "admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", role: 0)
5.times do |n|
  cate = Faker::Book.genre
  Category.create!(name: cate)
end
50.times do |n|
  title  = Faker::Book.title
  description = Faker::Hipster.paragraph(2,false,2)
  author = Faker::Book.author
  category_id = rand(1..5)
  Book.create! title: title,
    description: description,
    publish_date: "2016/2/5",
    author: author,
    number_page: rand(100..200),
    rate_avg: 0,
    category_id: category_id
end
