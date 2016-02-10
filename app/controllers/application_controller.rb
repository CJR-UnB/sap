class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :recupera_num_projetos_atuais, :recupera_historicos_individuais, :to_back

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
      if r.knowledge_request.member_id == current_member.id
        historicos_individuais << r
      end
    end

    historicos_individuais

  end

end