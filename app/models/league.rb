class League < ActiveRecord::Base

  has_many :rankings, :dependent => :destroy
  has_many :teams, :through => :rankings
  has_many :matches, :dependent => :nullify

  def ranking
    rankings.order('points DESC, played ASC, (goals - goals_against) DESC')
  end

end
