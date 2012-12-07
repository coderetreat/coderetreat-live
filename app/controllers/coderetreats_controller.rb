require 'coderetreats'
class CoderetreatsController < ApplicationController
  def running_today
    @coderetreats = CoderetreatLive::Coderetreats.running_today
    render (@coderetreats.empty? ? "none_running" : "running")
  end
end
