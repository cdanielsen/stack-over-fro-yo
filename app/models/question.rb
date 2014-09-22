class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers
  validates :headline, presence: true
end
