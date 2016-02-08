class ProjectsOverviewController < ApplicationController

  def index
    @projetos = Project.all
    @membros = Member.all
    @membros_alocados = MembersProject.all
  end

end