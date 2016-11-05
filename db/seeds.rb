User.create(name: "admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", role: 0)
15.times do |n|
  name = Faker::Name.name
  email = "ducnt#{n}@gmail.com"
  password = "123456"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end
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

for user_id in 2..10
  i = rand 10..15
  1.upto(i) do |book_id|
    content = Faker::Hipster.sentence
    rating = rand 1..5
    Review.create! book_id: book_id,
      user_id: user_id,
      content: content,
      rating: rating
  end
end

1.upto(15) do |n|
  book = Book.find n
  book.update_rate_avg
end
