require 'coderetreats'
class CoderetreatsController < ApplicationController
  def todays_running
    @coderetreats = CoderetreatLive::Coderetreats.running_today
    render (@coderetreats.empty? ? "none_running" : "running")
  end
end
