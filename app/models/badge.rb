class Badge < ActiveRecord::Base
  has_many :badge_users
  has_many :users, through: :badge_users

end

# this module is the basics and a DRY tool for all badges
# assumption 1) badge names are unique
# assumption 2) badges are only ever applied once
# assumption 3) badges can meet arbitrary conditions but once
#     met aren't revoked
module BadgeApplier

  def apply_to_helper(user, badge_name)
    new_badge = Badge.where(:name => badge_name).first # assume only one
    if badge_already_applied?(user, badge_name)
      return
    end
    if meets_condition?(user)
      user.badges << new_badge
    end
  end

  def badge_already_applied?(user, badge_name)
    user.badges.select {|badge| badge.name == badge_name}.length > 0
  end

end

# these don't have to inherit from Badge ... but might make sense for
# future functionality to have access to badge info
# Note: yes, the names are hard coded. Future implementation
#   would ideally want to use constants for IDs but right now 
#   nothing in the seed is ensuring a singular IDentifier
class HalfwayBadge < Badge
  include BadgeApplier
  def apply_to(user)
    apply_to_helper(user, "Half-Way")
  end
  def meets_condition?(user)
    user.videos.length >= 2
  end

end

class AllwayBadge < Badge
  include BadgeApplier
  def apply_to(user)
    apply_to_helper(user, "All-Way")
  end
  def meets_condition?(user)
    user.videos.length == Video.count
  end

end

class SpeedRunBadge < Badge
  include BadgeApplier
  def apply_to(user)
    apply_to_helper(user, "SpeedRun")
  end
  def meets_condition?(user)
    user.videos.select {|video| video.name == "Ruby classes"}.length > 0
  end

end

class BadgeManager
  @@badges = [HalfwayBadge.new, AllwayBadge.new, SpeedRunBadge.new]
  # build as class method but no reason can't be an instance method
  def self.apply_to_all(user)
    @@badges.map {|badge| badge.try(:apply_to, user) }
  end
end
