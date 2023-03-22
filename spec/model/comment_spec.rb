require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'invokes a method to increment comments_counter in a post' do
    user1 = User.create(name: 'Seko',
                        photo: 'https://mir-s3-cdn-cf.behance.net/project_modules/2800_opt_1/937b3c41332353.57a1ce913f308.jpg',
                        bio: 'bio here', posts_counter: 0)
    post1 = Post.create(author: user1, title: 'This is my post', text: 'This is the text content')
    comment = Comment.create(author: user1, post: post1, text: 'This is my comment!')

    comment.update_post_comments_counter
    expect(post1.comments_counter).to eq 2
  end
end
