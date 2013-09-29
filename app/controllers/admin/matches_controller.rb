class Admin::MatchesController < Admin::BaseController

  def index
    @matches = Match.order(:played_at)
  end

  def new
    @match = Match.new
  end

  def edit
    @match = Match.find params[:id]
  end

  def score
    @match = Match.find params[:match_id]
  end

  def create
    @match = Match.new match_params
    if @match.save
      redirect_to admin_matches_url, notice: t('admin.matches.created')
    else
      render action: 'new'
    end
  end

  def update
    @match = Match.find params[:id]
    if @match.update match_params
      redirect_to admin_matches_url, notice: t('admin.matches.updated')
    else
      render action: 'edit'
    end
  end

  def destroy
    @match = Match.find params[:id]
    @match.destroy
    redirect_to admin_matches_url, notice: t('admin.matches.destroyed')
  end

  private

  def match_params
    params.require(:match).permit(:home_team_name, :away_team_name, :played_at_date,
      :played_at_time, :home_team_goals, :away_team_goals, :league_id, :process_score)
  end
end
