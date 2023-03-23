require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user1) do
    User.create(
      name: 'Seko',
      photo: 'https://mir-s3-cdn-cf.behance.net/project_modules/2800_opt_1/937b3c41332353.57a1ce913f308.jpg',
      bio: 'bio here',
      posts_counter: 0
    )
  end
  let(:post1) { Post.create(author: user1, title: 'This is my post', text: 'This is the text content') }
  let(:post2) { Post.create(author: user1, title: 'This is my post', text: 'This is the text content') }
  let(:comment1) { Comment.create(author: user1, post: post1, text: 'This is my comment!') }
  let(:comment2) { Comment.create(author: user1, post: post1, text: 'This is another comment!') }

  it 'increments likes_counter' do
    comment1
    post1.increment_likes_counter
    expect(post1.likes_counter).to eq 1
  end

  it 'increments comments_counter' do
    comment1
    post1.increment_comments_counter
    expect(post1.comments_counter).to eq 2
  end

  it 'should return two recent comments' do
    comment1
    comment2
    recent_comments = post1.most_recent_comments
    expect(recent_comments.length).to eq(2)
  end
end
