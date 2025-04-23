10.times do |i|
  puts "starting generated data"

  post = Post.create!(
    title: "title #{i}",
    body: "body #{i}"
  )

  post.comments.create!(body: "some comment #{i}")  # создаёт Post::Comment с post_id

  puts "finishing generated data"
end