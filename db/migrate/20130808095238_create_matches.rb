class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :home_team
      t.references :away_team
      t.timestamps
    end
  end
end
