class Company < ActiveRecord::Base
  has_many :users
  has_many :badges, :through => :users

  def unique_badges
    badges.uniq
  end
  
  def to_s
    name
  end
end
