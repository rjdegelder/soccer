class AddPlayedAtToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :played_at, :datetime
  end
end
