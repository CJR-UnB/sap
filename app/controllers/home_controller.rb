class HomeController < ApplicationController

  before_action :authenticate_member!

  def index
    
    if current_member.try(:admin?)
      @requisicoes = KnowledgeRequest.where(request_status_id: 1)
    else
      @requisicoes = KnowledgeRequest.where(member_id: current_member.id)
    end
    
    @num_requisicoes = @requisicoes.count

  end

end