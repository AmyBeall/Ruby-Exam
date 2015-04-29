class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, through: :likes
end
