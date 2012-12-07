require 'coderetreats/sessions'
class Admin::CoderetreatSessionsController < ApplicationController
  def edit
    @session, @coderetreat = CoderetreatLive::Coderetreats::Sessions.for_coderetreat(params[:coderetreat_id], params[:id])
  end

  def create
    CoderetreatLive::Coderetreats::Sessions.start_new_session_for(params[:coderetreat_id], params[:coderetreat_session])
    redirect_to edit_coderetreat_status_url(coderetreat_id: params[:coderetreat_id])
  end

  def destroy
    CoderetreatLive::Coderetreats::Sessions.remove_session_from(params[:coderetreat_id], params[:id])
    redirect_to edit_coderetreat_status_url(coderetreat_id: params[:coderetreat_id])
  end
end
