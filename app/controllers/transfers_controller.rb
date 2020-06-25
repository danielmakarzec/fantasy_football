class TransfersController < ApplicationController
  def new
    @transfer = Transfer.new
    @transfers = Transfer.all
    @goalkeepers = Player.where(position: 'GK').sort { |a, b| a.surname <=> b.surname }
    @defenders = Player.where(position: 'D').sort { |a, b| a.surname <=> b.surname }
    @midfielders = Player.where(position: 'M').sort { |a, b| a.surname <=> b.surname }
    @forwards = Player.where(position: 'F').sort { |a, b| a.surname <=> b.surname }
  end

  def create
    @transfer = Transfer.new
    @transfer.team_id = params[:team_id]
    @transfer.player_id = params[:player_id]
    respond_to do |format|
      if @transfer.save!
        format.js
        format.html { redirect_to new_transfer_path }
        # raise
      else
        format.html { render 'new' }
      end
    end
  end

  def destroy
    @transfer = Transfer.find(params[:id])
    @transfer.destroy
    redirect_to new_transfer_path
  end
end
