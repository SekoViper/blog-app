require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Seko', photo: 'https://mir-s3-cdn-cf.behance.net/project_modules/2800_opt_1/937b3c41332353.57a1ce913f308.jpg', bio: 'bio here', posts_counter: 0) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
end
