class Admin::LeaguesController < Admin::BaseController

  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def edit
    @league = League.find params[:id]
  end

  def match
    @league = League.find params[:league_id]
    @league.matches.build match_params.merge({:process_score => true})
    if @league.save
      redirect_to admin_league_rankings_url(@league), notice: t('admin.leagues.match_added')
    else
      render action: 'new'
    end
  end

  def create
    @league = League.new league_params
    if @league.save
      redirect_to admin_leagues_url, notice: t('admin.leagues.created')
    else
      render action: 'new'
    end
  end

  def update
    @league = League.find params[:id]
    if @league.update league_params
      redirect_to admin_leagues_url, notice: t('admin.leagues.updated')
    else
      render action: 'edit'
    end
  end

  def destroy
    @league = League.find params[:id]
    @league.destroy
    redirect_to admin_leagues_url, notice: t('admin.leagues.destroyed')
  end

  private

  def league_params
    params.require(:league).permit(:name, :starts_on, :ends_on)
  end

  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :home_team_goals, :away_team_goals)
  end
end
