class CoderetreatsController < ApplicationController
  helper :coderetreats
  def todays
    @coderetreats = Coderetreat.todays
  end
end
