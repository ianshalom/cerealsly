# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

post1 = Post.create(title: 'Nine Nein', body: "We're soarin', flyin' There's not a star in heaven That we can't reach", img_url: 'https://i.imgur.com/Syw2Nkqb.jpg', user_id: 1)
post2 = Post.create(title: 'Lucky Charms', body: "If we're trying So breaking free You know the world can see us In a way that's different than who we are", img_url: 'https://i.imgur.com/Mc6sM3ob.jpg', user_id: 2)
comment1 = Comment.create(content: 'flfc', post: post1, user_id: 2)
comment2 = Comment.create(content: 'I love Jake Peralta!', post: post1, user_id: 1)
comment3 = Comment.create(content: 'Lucky Charms is how the IRA is funded', post: post2, user_id: 1)
comment4 = Comment.create(content: 'BEST. CEREAL. EVER.', post: post2, user_id: 2)