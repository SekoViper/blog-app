require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user1 = User.create(name: 'Seko', photo: 'Photo here', bio: 'bio here', posts_counter: 0)
    @user2 = User.create(name: '', photo: 'Photo here', bio: 'bio here', posts_counter: 0)
    @user3 = User.create(name: 'Seko', photo: 'Photo here', bio: 'bio here', posts_counter: -1)

    @post1 = Post.create(author: @user1, title: 'This is my first post', text: 'This is text')
    @post2 = Post.create(author: @user1, title: 'This is my second post', text: 'This is text')
  end

  it 'is valid with valid attributes' do
    expect(@user1).to be_valid
    expect(@user2).to_not be_valid
  end

  it 'post counter should be positive' do
    expect(@user3).to_not be_valid
  end
end
