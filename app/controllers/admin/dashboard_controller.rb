class Admin::DashboardController < Admin::BaseController

  def show
    @leagues = League.active
    @next_match = Match.scheduled.first
  end

end