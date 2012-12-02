require 'coderetreats'
class CoderetreatsController < ApplicationController
  def todays_running
    @coderetreats = CoderetreatLive::Coderetreats.todays
  end
end
