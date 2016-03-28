class Sector < ActiveRecord::Base

  has_many :areas, dependent: :destroy
  has_many :members

end
