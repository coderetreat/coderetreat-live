class CoderetreatsController < ApplicationController
  def todays
    @coderetreats = Coderetreat.todays
  end

  def edit
  end
end
