require 'coderetreats'
class Admin::CoderetreatsController < ApplicationController
  def manage
    @coderetreat = CoderetreatLive::Coderetreats.for_admin_token(params[:id])
  end

  def update_status
    redirect_to manage_coderetreat_url(id: params[:id])
  end
end
