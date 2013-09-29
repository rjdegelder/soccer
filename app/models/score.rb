class Score

  attr_accessor :home_team_goals, :away_team_goals

  def initialize home_team_goals = nil, away_team_goals = nil
    self.home_team_goals = home_team_goals
    self.away_team_goals = away_team_goals
  end

  def to_s
    [home_team_goals, away_team_goals].join(' - ')
  end

end