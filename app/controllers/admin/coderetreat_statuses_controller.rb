require 'coderetreats'
class Admin::CoderetreatStatusController < ApplicationController
  def edit
    @coderetreat = CoderetreatLive::Coderetreats.for_admin_token(params[:coderetreat_id])
  end

  def update
    coderetreat = CoderetreatLive::Coderetreats.update_status(params[:coderetreat_id], params[:status])
    redirect_to edit_coderetreat_status_url(coderetreat_id: coderetreat.admin_token)
  end
end
