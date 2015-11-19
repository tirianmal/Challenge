class Video < ActiveRecord::Base
  has_many :video_users
  has_many :users, through: :video_users
end
