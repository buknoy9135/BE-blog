class Comment < ApplicationRecord
  belongs_to :article

  validates :commenter, presence: true
  validates :body_of_the_comment, presence: true, length: { minimum: 10 }
end
