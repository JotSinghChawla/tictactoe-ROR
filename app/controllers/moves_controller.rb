class MovesController < ApplicationController

    before_action :check_for_winner

    def create 

        respond_to do |format|
            format.html {
                redirect_to @game
            }
        end
    end

    def check_for_winner

        if $winner == "x" || $winner == "o"
            redirect_to "/games"
        end
        
        @game = Game.find(params[:game_id])
        @game.move(params[:row], params[:col])

        # @game.state.each do |k,v|
        #     if v.values.include? nil
        #         break
        #     end
        # end
        if ( !@game.state[0.to_s].values.include? nil ) && ( !@game.state[1.to_s].values.include? nil ) && ( !@game.state[2.to_s].values.include? nil )
            logger.info "\n\n\nIts a Tie\n\n\n"
            $winner = "tie"
        end

        if @game.state[0.to_s][0.to_s] == @game.state[0.to_s][1.to_s] && @game.state[0.to_s][1.to_s] == @game.state[0.to_s][2.to_s] 
            logger.info "======================  #{@game.state}"
            $winner = @game.state[0.to_s][0.to_s]

        elsif @game.state[1.to_s][0.to_s] == @game.state[1.to_s][1.to_s] && @game.state[1.to_s][1.to_s] == @game.state[1.to_s][2.to_s] 
            logger.info "======================  #{@game.state}"
            $winner = @game.state[1.to_s][0.to_s]

        elsif @game.state[2.to_s][0.to_s] == @game.state[2.to_s][1.to_s] && @game.state[2.to_s][1.to_s] == @game.state[2.to_s][2.to_s] 
            logger.info "======================  #{@game.state}"
            $winner = @game.state[2.to_s][0.to_s]

        elsif @game.state[0.to_s][0.to_s] == @game.state[1.to_s][0.to_s] && @game.state[1.to_s][0.to_s] == @game.state[2.to_s][0.to_s]  
            logger.info "======================  #{@game.state}"
            $winner = @game.state[0.to_s][0.to_s]

        elsif @game.state[0.to_s][1.to_s] == @game.state[1.to_s][1.to_s] && @game.state[1.to_s][1.to_s] == @game.state[2.to_s][1.to_s]
            logger.info "======================  #{@game.state}"
            $winner = @game.state[0.to_s][1.to_s]

        elsif @game.state[0.to_s][2.to_s] == @game.state[1.to_s][2.to_s] && @game.state[1.to_s][2.to_s] == @game.state[2.to_s][2.to_s] 
            logger.info "======================  #{@game.state}"
            $winner = @game.state[2.to_s][0.to_s]
            
        elsif @game.state[0.to_s][0.to_s] == @game.state[1.to_s][1.to_s] && @game.state[1.to_s][1.to_s] == @game.state[2.to_s][2.to_s] 
            logger.info "======================  #{@game.state}"
            $winner = @game.state[0.to_s][0.to_s]

        elsif @game.state[0.to_s][2.to_s] == @game.state[1.to_s][1.to_s] && @game.state[1.to_s][1.to_s] == @game.state[2.to_s][0.to_s]
            logger.info "======================  #{@game.state}" 
            $winner = @game.state[0.to_s][2.to_s]
        end
    end
end
