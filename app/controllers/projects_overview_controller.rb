class ProjectsOverviewController < ApplicationController

  def index
    @projetos = Project.where(project_status_id: ProjectStatus.where(description: 'Em desenvolvimento').try(:first).try(:id))

    Project.where(project_status_id: ProjectStatus.where(description: 'Atrasado').try(:first).try(:id)).each do |x|
      @projetos << x
    end

    @membros = Member.all
    @membros_alocados = MembersProject.all
  end

end