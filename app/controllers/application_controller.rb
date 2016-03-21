class ApplicationController < ActionController::Base

  include ActionView::Helpers::UrlHelper

  protect_from_forgery with: :exception

  helper_method :recupera_num_projetos_atuais, :recupera_historicos_individuais, :to_back, 
                :esta_em_membros?, :esta_em_conhecimentos?, :esta_em_projetos?,
                :recupera_admins, :mensagem_tabela_vazia

  def current_ability
    @current_ability ||= Ability.new(current_member)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'Você não possui autorização.'
    redirect_to request.referrer || home_path
  end

  def to_back
    flash[:error] = 'Você não possui autorização.'
    redirect_to home_path
  end

  def after_sign_in_path_for(resource)
    home_path
  end

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  def recupera_admins(filtro)
    admins = []

    Member.all.each do |member|
      if member.try(:role_id) == Role.where(description: filtro).first.id
        admins << member
      end
    end

    admins
  end

  def recupera_num_projetos_atuais(filtro)
    projetos = Project.all

    atuais = 0

    projetos.each do |projeto|
      if projeto.project_status_id == ProjectStatus.where(description: filtro).first.id
        atuais += 1
      end
    end

    atuais
  end

  def recupera_historicos_individuais
    historicos_individuais = []

    RequestHistory.all.each do |r|
      if r.knowledge_request.try(:member_id) == current_member.id
        historicos_individuais << r
      end
    end

    historicos_individuais
  end

  def esta_em_membros?
    current_page?(home_path) or current_page?(members_path) or current_page?(sectors_path) or current_page?(jobs_path) or current_page?(areas_path) or current_page?(member_statuses_path) or current_page?(roles_path)
  end

  def esta_em_conhecimentos?
    current_page?(request_statuses_path) or current_page?(knowledges_path) or current_page?(knowledge_requests_path) or current_page?(request_histories_path) or current_page?(knowledge_levels_path) or current_page?(activities_path) or current_page?(activity_types_path) or current_page?(technologies_path) or current_page?(knowledges_members_path) or current_page?(activities_members_path)
  end

  def esta_em_projetos?
    current_page?(projects_path) or current_page?(projects_overview_path) or current_page?(project_histories_path) or current_page?(project_member_histories_path) or current_page?(members_projects_path) or current_page?(project_statuses_path) or current_page?(project_roles_path)
  end

  def mensagem_tabela_vazia
    "Ops! Parece que ainda não temos nada aqui."
  end

end