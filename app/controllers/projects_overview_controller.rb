class ProjectsOverviewController < ApplicationController

  def index
    @projetos = Project.where(project_status_id: ProjectStatus.where(description: 'Em desenvolvimento').first.id)

    Project.where(project_status_id: ProjectStatus.where(description: 'Atrasado').first.id).each do |x|
      @projetos << x
    end

    @membros = Member.all
    @membros_alocados = MembersProject.all
  end

end