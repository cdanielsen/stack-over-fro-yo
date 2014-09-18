class User < ActiveRecord::Base

has_many :questions
has_many :answers, through: :questions
has_many :votes

has_secure_password

validates :name, presence: true
validates :password, presence: true
validates_uniqueness_of :email

end
