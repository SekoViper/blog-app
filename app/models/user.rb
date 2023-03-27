class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Associations
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  # Validations
  validates :name, :bio, :photo, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  # Returns the user's most recent posts, sorted by creation date, and limited to a given number (defaulting to 3)
  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  # Increments the user's `posts_counter` attribute by one
  def increment_posts_counter
    update(posts_counter: self.posts_counter += 1)
  end
end
