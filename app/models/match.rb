class Match < ActiveRecord::Base

  belongs_to :home_team, :class_name => 'Team'
  belongs_to :away_team, :class_name => 'Team'
  belongs_to :league

  validates :home_team, :presence => true
  validates :away_team, :presence => true
  validates :played_at, :presence => true

  scope :played, -> { where('played_at < ?', Time.current) }
  scope :scheduled, -> { where('played_at >= ?', Time.current) }

  after_save :update_ranking

  def teams
    "#{home_team.name} - #{away_team.name}"
  end

  def score
    "#{home_team_goals} - #{away_team_goals}"
  end

  def played?
    played_at < Time.current
  end

  def update_ranking
    if home_team_goals.present? && away_team_goals.present?
      ScoreCalculator.instance.process self
    end
  end

  def played_at_date
    played_at.try(:to_date)
  end

  def played_at_date= value
    date = DateTime.parse value
    if played_at.nil?
      self.played_at = date
    else
      self.played_at = played_at.change :year => date.year, :month => date.month, :day => date.day
    end
  end

  def played_at_time
    played_at.try(:to_time)
  end

  def played_at_time= value
    time = DateTime.parse value
    if played_at.nil?
      self.played_at = time
    else
      self.played_at = played_at.change :hour => time.hour, :min => time.min
    end
  end

end
