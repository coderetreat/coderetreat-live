class Admin::CoderetreatSessionsController < ApplicationController
  def create
    redirect_to manage_status_coderetreat_url(id: params[:coderetreat_id])
  end
end
