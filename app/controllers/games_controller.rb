class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def create 
    @game = Game.new(game_params)
    if @game.save then redirect_to @game end
  end

  private

  def game_params
    # logger.info "\nLOL\n #{params[:state]} \n\n"

    params
    .permit(:playero, :playerx)
    # .require(:game)
    
  #   .reverse_merge(state: { 
  #     0 => { 0 => nil, 1 => nil, 2 => nil },
  #     1 => { 0 => nil, 1 => nil, 2 => nil },
  #     2 => { 0 => nil, 1 => nil, 2 => nil }
  # }, match_winner: "NO one", current_symbol: "o")
  end

end
