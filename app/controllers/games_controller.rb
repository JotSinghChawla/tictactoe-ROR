class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def create 
    # @game = Game.new(game_params, state: state, current_symbol: current_symbol)
    redirect_to Game.create
  end
end
