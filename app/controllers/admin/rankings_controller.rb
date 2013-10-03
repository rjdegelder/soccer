class Admin::RankingsController < Admin::BaseController

  def index
    @league = League.find params[:league_id]
    @rankings = @league.ranking
    @match = @league.matches.build
  end

  def show
    @league = League.find params[:league_id]
    @rankings = @league.ranking
  end

  def new
    @ranking = Ranking.new
  end

  def edit
    @ranking = Ranking.find params[:id]
  end

  def create
    @ranking = Ranking.new ranking_params
    if @ranking.save
      redirect_to admin_rankings_url, notice: t('admin.rankings.created')
    else
      render action: 'new'
    end
  end

  def update
    @ranking = Ranking.find params[:id]
    if @ranking.update ranking_params
      redirect_to admin_rankings_url, notice: t('admin.rankings.updated')
    else
      render action: 'edit'
    end
  end

  def destroy
    @ranking = Ranking.find params[:id]
    @ranking.destroy
    redirect_to admin_rankings_url, notice: t('admin.rankings.destroyed')
  end

  private

  def ranking_params
    params.require(:ranking).permit(:team_id, :league_id, :played, :points, :won, :lost, :drawn, :goals, :goals_against)
  end
end
