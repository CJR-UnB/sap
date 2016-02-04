class ApplicationController < ActionController::Base

  helper_method :recupera_num_projetos_atuais

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_ability
    @current_ability ||= Ability.new(current_member)
  end

  rescue_from CanCan::AccessDenied do
    redirect_to root_url, alert: 'Acesso negado.'
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

end