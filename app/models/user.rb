require 'badge'

class User < ActiveRecord::Base
  acts_as_decorables

  belongs_to :company

  has_many :badge_users
  has_many :badges, through: :badge_users

  has_many :video_users
  has_many :videos, through: :video_users

  def to_s
    name
  end

  def watch_video video
    if not videos.any? {|vid| video.name == vid.name}
      videos << video # causing dupes still
      BadgeManager.apply_to_all(self)
    else
      # increment number of times viewed
      video_to_update = self.video_users.select {|vu| vu.video.name = video.name}.first
      video_to_update.views += 1
    end
  end

  def watched? video
    videos.include? video
  end

  def times_watched video
    video_users.select{|vu| vu.video.name == video.name}.first.views
  end

end
