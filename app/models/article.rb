class Article <ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validate :title, presence: true,
                   length: { minimum: 5 }
  belongs_to :user
end