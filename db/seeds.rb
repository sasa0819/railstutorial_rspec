User.create!(username:  "shunsuke",
             email: "example@railstutorial.org",
             introduce: "こんにちは！",
             password:              "aaaa",
             password_confirmation: "aaaa")

99.times do |n|
  username  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  introduce = "こんにちは"
  password = "password"
  User.create!(username:  username,
               email: email,
               introduce: introduce,
               password:              password,
               password_confirmation: password)

end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }