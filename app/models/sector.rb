class Sector < ActiveRecord::Base

  has_many :areas
  has_many :members

end
