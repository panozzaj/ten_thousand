class ReportsController < ApplicationController
  require_user

  def calendar
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @event_strips = PracticeLog.event_strips_for_month(@shown_month, :include => :expertise)
  end

end
