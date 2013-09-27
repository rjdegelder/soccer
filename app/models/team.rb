class Team < ActiveRecord::Base

  has_many :home_matches, :class_name => 'Match', :foreign_key => :home_team_id
  has_many :away_matches, :class_name => 'Match', :foreign_key => :away_team_id
  has_many :rankings
  has_many :leagues, :through => :rankings

  def matches
    Team.includes(:home_matches, :away_matches).where("matches.home_team_id = :id OR matches.away_team_id = :id", {:id => id}).references(:matches)
  end

end
