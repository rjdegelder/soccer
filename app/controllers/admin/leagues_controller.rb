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
    params.require(:league).permit(:name)
  end
end
