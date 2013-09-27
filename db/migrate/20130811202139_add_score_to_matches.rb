class AddScoreToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :home_team_goals, :integer
    add_column :matches, :away_team_goals, :integer
  end
end
