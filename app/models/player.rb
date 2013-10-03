class Player < ActiveRecord::Base
  belongs_to :team

  validates :team, :presence => true
end
