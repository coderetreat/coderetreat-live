require 'coderetreats'
class CoderetreatsController < ApplicationController
  def todays_running
    @coderetreats = CoderetreatLive::Coderetreats.running_today
  end
end
