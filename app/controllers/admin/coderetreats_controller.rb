module Admin
  class CoderetreatsController < ApplicationController
    def edit
      @coderetreat = Coderetreat.for_admin(params[:id])
    end

    def update
      @coderetreat = Coderetreat.for_admin(params[:id])
      @coderetreat.change_state params[:new_state]
      render :edit
    end
  end
end
