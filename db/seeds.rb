# User.create!(nickname: 'ishizuka', email: 'test@example.com', password: 'password')

# Article.create(body: 'test1.body', title: 'test1.title', description: 'test1.description', user_id: 1)

# Comment.create!(message: 'test1.comment', user_id: 1, article_id: 1)

[*(1..20)].each do |i|
  Article.create!(body: "test#{i}", title: "test#{i}", description: "test#{i}", images: "https://picsum.photos/300/200", user_id: 1)
end

