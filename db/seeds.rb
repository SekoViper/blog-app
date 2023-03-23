user = User.create(name: 'Seko', photo: 'https://avatars.githubusercontent.com/u/33840476?s=400&u=bc347a2a539dc84c8ed1dce66216610f1fbfbbf9&v=4', bio: 'I am super user')
user2 = User.create(name: 'Katie', photo: 'https://cdn2.psychologytoday.com/assets/styles/manual_crop_1_91_1_1528x800/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=7lrLYx-B', bio: 'Hello, Katie here..')

post1 = Post.create(author: user, title: "My first post", text: "This is another post")
post2 = Post.create(author: user, title: "My second post", text: "This is my second post...")
post3 = Post.create(author: user, title: "My third post", text: "This is my third post...")

post4 = Post.create(author: user2, title: "My first post", text: "This is another post")
post5 = Post.create(author: user2, title: "My second post", text: "This is my second post...")
post6 = Post.create(author: user2, title: "My third post", text: "This is my third post...")

comment1 = Comment.create(author: user2, post: post1, text: 'Hi Seko, thanks for sharing!')