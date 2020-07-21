class PlayersController < ApplicationController
  def index
    players = Player.all.order("score desc").limit(10)

    render json: players.as_json(only: [:name, :city, :score]), 
                              status: :ok
  end

  def show
    player = Player.find_by(id: params[:id])

    if player.nil?
      render json: {
        errors:[
          "Not Found"
      ]
      }, status: :not_found
      return
    end

    render json: player.as_json(only: [:name, :city, :score]), 
                              status: :ok
  end

  def create
    player = Player.new(player_params)
    if player.save
      render json: player.as_json(only: [:id]),                       status: :created
    else
      render json: {errors: player.errors.messages}, status: :bad_request
    end
    
  end
  
  private
  def player_params
    return params.permit(:name, :city, :score)
  end
end
