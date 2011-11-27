module Admin
  class CoderetreatsController < ApplicationController
    def edit
      @coderetreat = Coderetreat.for_admin(params[:id])
    end
  end
end
