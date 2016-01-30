class Member < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :area
  belongs_to :sector
  belongs_to :job
  belongs_to :role

  has_many :knowledge_requests
  has_many :project_member_histories

  has_and_belongs_to_many :activites
  has_and_belongs_to_many :knowledges
  has_and_belongs_to_many :projects

end
