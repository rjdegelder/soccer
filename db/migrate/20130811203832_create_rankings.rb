class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :league
      t.references :team
      t.integer :played, :default => 0
      t.integer :points, :default => 0
      t.integer :won, :default => 0
      t.integer :lost, :default => 0
      t.integer :drawn, :default => 0
      t.integer :goals, :default => 0
      t.integer :goals_against, :default => 0

      t.timestamps
    end
  end
end
