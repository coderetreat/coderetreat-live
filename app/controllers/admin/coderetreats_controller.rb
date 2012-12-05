require 'coderetreats'
class Admin::CoderetreatsController < ApplicationController
  def manage
    @coderetreat = CoderetreatLive::Coderetreats.for_admin_token(params[:id])
  end
end
