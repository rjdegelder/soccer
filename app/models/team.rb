class Team < ActiveRecord::Base

  has_many :home_matches, :class_name => 'Match', :foreign_key => :home_team_id, :dependent => :destroy
  has_many :away_matches, :class_name => 'Match', :foreign_key => :away_team_id, :dependent => :destroy
  has_many :rankings, :dependent => :destroy
  has_many :leagues, :through => :rankings

  validates :name, :uniqueness => true

  def matches
    Team.includes(:home_matches, :away_matches).where("matches.home_team_id = :id OR matches.away_team_id = :id", {:id => id}).references(:matches)
  end

end
