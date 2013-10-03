class Admin::PlayersController < Admin::BaseController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find params[:id]
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find params[:id]
  end

  def create
    @player = Player.new player_params
    if @player.save
      redirect_to admin_players_url, notice: t('admin.players.created')
    else
      render action: 'new'
    end
  end

  def update
    @player = Player.find params[:id]
    if @player.update player_params
      redirect_to admin_players_url, notice: t('admin.players.updated')
    else
      render action: 'edit'
    end
  end

  def destroy
    @player = Player.find params[:id]
    @player.destroy
    redirect_to admin_players_url, notice: t('admin.players.destroyed')
  end

  private

  def player_params
    params.require(:player).permit(:name, :team_id)
  end

end
