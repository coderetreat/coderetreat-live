require 'coderetreats'
class Admin::CoderetreatsController < ApplicationController
  def manage
    @coderetreat = CoderetreatLive::Coderetreats.for_admin(params[:id])
  end
end
