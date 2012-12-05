require 'coderetreats/sessions'
class Admin::CoderetreatSessionsController < ApplicationController
  def create
    CoderetreatLive::Coderetreats::Sessions.start_new_session_for(params[:coderetreat_id], params[:session])
    redirect_to manage_status_coderetreat_url(id: params[:coderetreat_id])
  end
end
