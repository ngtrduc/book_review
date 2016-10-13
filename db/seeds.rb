20.times do |n|
  Book.create! title: "New Book" + (n+1).to_s,
    description: "Noi dung content",
    publish_date: "2016/2/5",
    author: "Pham Thu Hang" + (n+1).to_s,
    number_page: n+123,
    picture: "/assets/a4.jpg",
    rate_avg: 5,
    category_id: 1
end
