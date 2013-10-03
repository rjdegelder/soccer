class Admin::TeamsController < Admin::BaseController

  def index
    @teams = Team.all
    if params[:term]
      @teams = @teams.where('name LIKE ?', "%#{params[:term]}%")
    end
    respond_to do |format|
      format.html
      format.json { render :json => @teams, :only => [:id, :name] }
    end
  end

  def show
    @team = Team.find params[:id]
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find params[:id]
  end

  def create
    @team = Team.new team_params
    if @team.save
      redirect_to admin_teams_url, notice: t('admin.teams.created')
    else
      render action: 'new'
    end
  end

  def update
    @team = Team.find params[:id]
    if @team.update team_params
      redirect_to admin_teams_url, notice: t('admin.teams.updated')
    else
      render action: 'edit'
    end
  end

  def destroy
    @team = Team.find params[:id]
    @team.destroy
    redirect_to admin_teams_url, notice: t('admin.teams.destroyed')
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
