User.create(name: "admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", role: 0)
User.create! name: "test", email: "test@gmail.com",
  password: "123456", password_confirmation: "123456", role: 1,
  avatar: File.open(File.join(Rails.root,
        "app/assets/images/avatar/test.jpg")
15.times do |n|
  name = Faker::Name.name
  email = "ducnt#{n}@gmail.com"
  password = "123456"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end

# create category
Category.create! name: "Art & Photography"
Category.create! name: "Children's Book"
Category.create! name: "Education & Teaching"
Category.create! name: "Literature"
Category.create! name: "Computer & Technology"

# create book with reviews
Book.create! title: "Born to Run",
  description: "“Writing about yourself is a funny business…But in a project like this, the writer has made one promise, to show the reader his mind. In these pages, I’ve tried to do this.” —Bruce Springsteen, from the pages of Born to Run",
  author: "Bruce Springsteen",
  publish_date: "2016/2/5",
  category_id: 1,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/1.jpg"))

Book.create! title: "Clear Seeing Place: Studio Visits",
  description: "From the salt marshes and moss-draped live oaks of the South Carolina Lowcountry to the New York art world, Clear Seeing Place takes the reader behind the studio door to explore the making of a painter in intimate detail. Brimming with the joy of process and a love of art history, Brian Rutenberg reveals the places, people, and experiences that led to the paint¬ings for which he is well known today. This book is packed with ideas, observations, techniques, and career advice all thought¬fully arranged into six sections designed to inspire artists of all levels, as well as anyone interested in creativity. Clear Seeing Place is a companion to the artist’s popular YouTube series, “Brian Rutenberg Studio Visits,” and is a love letter to painting written by a painter.",
  author: "Brian Rutenberg",
  publish_date: "2016/2/5",
  category_id: 1,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/2.jpg"))



Book.create! title: "Minding the Muse",
  description: "Minding the Muse is a practical handbook for the artist or writer—highly experienced, aspiring, or somewhere in between. Long draws from her extensive background as a poet, writer, and master teacher, but also gathers the insights and practices of a wide range of high-achieving artists, including mystery writer Raymond Chandler, choreographer Twyla Tharp, poet and performance artist Patti Smith, and the painter Joan Miró. Beginning with the first sparks of artistic creation—“Gathering, Hoarding, Conceptualizing”—Long moves through the various stages to “Completing Works” and “Poet as Peddler, Painter as Pusher: Marketing.” Every creative worker will find something here to take to heart and into the studio or workroom.",
  author: "Priscilla Long",
  publish_date: "2016/2/5",
  category_id: 1,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/3.jpg"))

Book.create! title: "If You Give a Mouse a Brownie",
  description: "If you give a mouse a brownie, he's going to ask for some ice cream to go with it. When you give him the ice cream, he'll probably ask you for a spoon. He'll start drumming on the table. Drumming will get him so excited he'll want to start a band. . . .",
  author: "Laura Numeroff",
  publish_date: "2016/2/5",
  category_id: 2,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/4.jpg"))

Book.create! title: "First 100 Words",
  description: "Your little one will soon learn some essential first words and pictures with this bright board book. There are 100 color photographs to look at and talk about, and 100 simple first words to read and learn, too. The pages are made from tough board for hours of fun reading, and the cover is softly padded for little hands to hold.",
  author: "Roger Priddy ",
  publish_date: "2016/2/5",
  category_id: 2,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/5.jpg"))

Book.create! title: "Puppy Birthday to You! ",
  description: "Can the puppies from Nickelodeon’s PAW Patrol throw Chase a surprise birthday party AND save Adventure Bay? This action-packed Little Golden Book is sure to thrill boys and girls ages 2 to 5.",
  author: "Golden Books",
  publish_date: "2016/2/5",
  category_id: 2,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/6.jpg"))

Book.create! title: "The Official ACT Prep Guide",
  description: "The Official ACT Prep Guide 2016-2017 is the bestselling resource for students gearing up for the ACT test. This comprehensive guide walks you through the entire test experience, from registration through results, with expert advice straight from the test's creators. You'll find effective test-taking strategies, tips for boosting your score on the English, math, reading, and science tests, and detailed information on the enhanced optional writing test. Three new full-length practice tests help you assess your readiness so you can spot weak areas well in advance, and the ACT experts provide valuable advice on preparing both mentally and physically so you can manage anxiety and be fully confident on test day. You also get free online bonus content to help you start college on the right foot, including tips for preparing an application that gets noticed, getting into your first-choice school, being a successful student, and much more.",
  author: "ACT",
  publish_date: "2016/2/5",
  category_id: 3,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/7.jpg"))

Book.create! title: "Grit: The Power of Passion and Perseverance Audible",
  description: "In this must-listen book for anyone striving to succeed, pioneering psychologist Angela Duckworth shows parents, educators, students, and businesspeople - both seasoned and new - that the secret to outstanding achievement is not talent but a focused persistence called 'grit'.

Why do some people succeed and others fail? Sharing new insights from her landmark research on grit, MacArthur 'genius' Angela Duckworth explains why talent is hardly a guarantor of success. Rather, other factors can be even more crucial, such as identifying our passions and following through on our commitments.",
  author: "Angela Duckworth ",
  publish_date: "2016/2/5",
  category_id: 3,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/8.jpg"))

Book.create! title: "The Official SAT Study Guide, 2016 Edition",
  description: "The Official SAT Study Guide includes 4 official SAT® practice tests created by the test maker. As part of the College Board’s commitment to transparency, all four practice tests are available on the College Board’s website, but The Official SAT Study Guide is the only place to find them in print along with over 300 pages of additional instruction, guidance, and test information. Launching in March 2016, the new SAT introduces new question formats and content",
  author: "The College Board",
  publish_date: "2016/2/5",
  category_id: 3,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/9.jpg"))

Book.create! title: "Knight Kyle and the Magic Silver Lance ",
  description: "Beyond the great forest and towering Dragon Mountain lies Fairyland, a land of elves and trolls, dragons and giants, magicians and fairies. And in one corner, Fairyland East, lives Knight Kyle.

Kyle’s great-grandfather once possessed a silver lance that, according to legend, gave its owner invincible power. The lance is now missing, and Kyle is always looking for it, but so are his worst enemies: the robber Rasputin and the evil magician Balduin.",
  author: "Oliver Pötzsch",
  publish_date: "2016/2/5",
  category_id: 4,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/10.jpg"))

Book.create! title: "Rush Revere and the Presidency",
  description: "Join Rush Revere on another action-packed journey! Rush and his friends head back in time to the early days of our independent nation to watch the early American presidents George Washington, John Adams, and Thomas Jefferson in action!",
  author: "Rush Limbaugh ",
  publish_date: "2016/2/5",
  category_id: 4,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/11.jpg"))

Book.create! title: "The Wonderful Things You Will Be",
  description: "From brave and bold to creative and clever, Emily Winfield Martin's rhythmic rhyme expresses all the loving things that parents think of when they look at their children. With beautiful, and sometimes humorous, illustrations, and a clever gatefold with kids in costumes, this is a book grown-ups will love reading over and over to kids—both young and old. A great gift for any occasion, but a special stand-out for baby showers, birthdays, and graduation. The Wonderful Things You Will Be has a loving and truthful message that will endure for lifetimes.",
  author: "Emily Winfield Martin",
  publish_date: "2016/2/5",
  category_id: 4,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/12.jpg"))

Book.create! title: "Photography Demystified",
  description: "Photography Demystified—Your Guide to Exploring Light and Creative Ideas, Taking You to the Next Level builds upon the knowledge gained from my first book in the series. After reading the first volume, you are now ready to take all of that knowledge, get out there, and take even more amazing photographs than you ever dreamed. The problem—what to photograph, what specifics to consider for that situation, and when and how to do so? ",
  author: "David McKay",
  publish_date: "2016/2/5",
  category_id: 5,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/13.jpg"))

Book.create! title: "The Linux Programming Interface",
  description: "The Linux Programming Interface is the definitive guide to the Linux and UNIX programming interface—the interface employed by nearly every application that runs on a Linux or UNIX system.
In this authoritative work, Linux programming expert Michael Kerrisk provides detailed descriptions of the system calls and library functions that you need in order to master the craft of system programming, and accompanies his explanations with clear, complete example programs.",
  author: "Michael Kerrisk ",
  publish_date: "2016/2/5",
  category_id: 5,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/14.jpg"))

Book.create! title: "The Handmade Entrepreneur—How to Sell on Etsy, or Anywhere Else",
  description: "Every day you wake up and eagerly visit your Etsy account (or website) to see how many sales, clicks, or 'favors' it has received from shoppers, but for many, this routine only ends in disappointment. ",
  author: "Michael Harld",
  publish_date: "2016/2/5",
  category_id: 5,
  number_page: rand(100..200),
  rate_avg: 0,
  picture: File.open(File.join(Rails.root,
        "app/assets/images/book/15.jpg"))

#create randombook
20.times do |n|
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

#create reviews
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

#update avg_rating
1.upto(15) do |n|
  book = Book.find n
  book.update_rate_avg
end
