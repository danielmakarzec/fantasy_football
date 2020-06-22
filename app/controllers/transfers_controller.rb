class TransfersController < ApplicationController
  def new
    @transfers = Transfer.all
    @transfer = Transfer.new
    @players = Player.all
  end

  def create
    @transfer = Transfer.new
    @transfer.team_id = params[:team_id]
    @transfer.player_id = params[:player_id]
    # @transfer.save!
    respond_to do |format|
      if @transfer.save!
        format.js
        format.html { redirect_to new_transfer_path }
        # format.json { render json: @transfer.messages, status: 'siccess'}
      else
        format.html { render 'new' }
        # format.json { render json: @transfer.errors, status: 'something went wrong' }
      end
    end
  end
end
