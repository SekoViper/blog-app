require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @user1 = User.create(name: 'Seko', photo: 'Photo here', bio: 'bio here', posts_counter: 0)

    @post1 = Post.create(author: @user1, title: 'This is my post', text: 'This is the text content')

    @like = Like.create(author: @user1, post: @post1)
  end

  it 'invokes a method to increment likes_counter in a post' do
    @like.update_post_likes_counter
    expect(@post1.likes_counter).to eq 2
  end
end
