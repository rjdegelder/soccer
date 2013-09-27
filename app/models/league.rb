class League < ActiveRecord::Base

  has_many :rankings
  has_many :teams, :through => :rankings
  has_many :matches

end
