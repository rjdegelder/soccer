class League < ActiveRecord::Base

  has_many :rankings, :dependent => :destroy
  has_many :teams, :through => :rankings
  has_many :matches, :dependent => :nullify

  scope :active, -> { where("starts_on < :today AND ends_on > :today", :today => Date.today) }

  def ranking
    rankings.order('points DESC, played ASC, (goals - goals_against) DESC')
  end

  def active?
    starts_on < Date.today && ends_on > Date.today
  end

end
