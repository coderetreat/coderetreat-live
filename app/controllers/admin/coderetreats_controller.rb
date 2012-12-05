require 'coderetreats'
class Admin::CoderetreatsController < ApplicationController
  def manage_status
    @coderetreat = CoderetreatLive::Coderetreats.for_admin_token(params[:id])
  end

  def update_status
    redirect_to manage_status_coderetreat_url(id: params[:id])
  end
end
