class AddStartsOnAndEndsOnToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :starts_on, :date
    add_column :leagues, :ends_on, :date
  end
end
