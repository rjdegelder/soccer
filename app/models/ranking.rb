class Ranking < ActiveRecord::Base

  belongs_to :team
  belongs_to :league

  def add_win goals, goals_against
    self.points += 3
    self.played += 1
    self.won += 1
    add_goals goals, goals_against
    save
  end

  def add_loss goals, goals_against
    self.played += 1
    self.lost += 1
    add_goals goals, goals_against
    save
  end

  def add_draw goals, goals_against
    self.points += 1
    self.played += 1
    self.drawn += 1
    add_goals goals, goals_against
    save
  end

  private

  def add_goals goals, goals_against
    self.goals += goals
    self.goals_against += goals_against
  end

end
