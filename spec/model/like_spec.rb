require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'incrementing likes_counter in a post' do
    let(:user1) { User.create(name: 'Seko', photo: 'https://mir-s3-cdn-cf.behance.net/project_modules/2800_opt_1/937b3c41332353.57a1ce913f308.jpg', bio: 'bio here', posts_counter: 0) }
    let(:post1) { Post.create(author: user1, title: 'This is my post', text: 'This is the text content') }
    let(:like) { Like.create(author: user1, post: post1) }

    it 'should increment likes_counter in the associated post' do
      like.update_post_likes_counter
      expect(post1.likes_counter).to eq(2)
    end
  end
end
