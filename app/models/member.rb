class Member < ActiveRecord::Base
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :area
  belongs_to :sector
  belongs_to :job
  belongs_to :role
  belongs_to :member_status

  has_many :knowledge_requests
  has_many :project_member_histories

  has_and_belongs_to_many :activities
  has_and_belongs_to_many :knowledges
  has_and_belongs_to_many :projects

  def member_name
    "#{self.name} #{self.last_name}"
  end

  def admin?
    self.role.role == "Administrador"
  end

  def mod?
    self.role.role == "Moderador"
  end

  def user?
    self.role.role == "Usuário"
  end

end