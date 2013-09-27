require 'singleton'

class ScoreCalculator
  include Singleton

  def process match
    if home_team_won? match
      ranking_for(match.home_team, match.league).add_win match.home_team_goals, match.away_team_goals
      ranking_for(match.away_team, match.league).add_loss match.away_team_goals, match.home_team_goals
    elsif away_team_won? match
      ranking_for(match.away_team, match.league).add_win match.away_team_goals, match.home_team_goals
      ranking_for(match.home_team, match.league).add_loss match.home_team_goals, match.away_team_goals
    else
      ranking_for(match.home_team, match.league).add_draw match.home_team_goals, match.away_team_goals
      ranking_for(match.away_team, match.league).add_draw match.away_team_goals, match.home_team_goals
    end
  end

  def ranking_for team, league
    team.rankings.where(:league => league).first || team.rankings.build(:league => league)
  end

  def home_team_won? match
    match.home_team_goals > match.away_team_goals
  end

  def away_team_won? match
    match.away_team_goals > match.home_team_goals
  end

end