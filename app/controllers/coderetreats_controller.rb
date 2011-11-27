class CoderetreatsController < ApplicationController
  def todays
    @coderetreats = Coderetreat.todays
  end
end
