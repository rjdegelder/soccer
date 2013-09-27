class AddLeagueIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :league_id, :integer
    add_index :matches, :league_id
  end
end
