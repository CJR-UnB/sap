class Member < ActiveRecord::Base
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :area
  belongs_to :sector
  belongs_to :job
  belongs_to :role

  has_many :knowledge_requests
  has_many :project_member_histories

  has_and_belongs_to_many :activites
  has_and_belongs_to_many :knowledges
  has_and_belongs_to_many :projects

  def admin?
    self.role.description == "Administrador"
  end

  def member_name
    "#{self.name} #{self.last_name}"
  end

end
