class DailyReport::FavoritesController < ApplicationController

  def create
    daily_report = DailyReport.find(params[:daily_report_id])
    favorite = current_employee.favorites.new(daily_report_id: daily_report.id)
    favorite.save
    daily_report.create_notification_favorite!(current_employee)
    redirect_to daily_report_path(daily_report)
  end

  def destroy
    daily_report = DailyReport.find(params[:daily_report_id])
    favorite = current_employee.favorites.find_by(daily_report_id: daily_report.id)
    favorite.destroy
    redirect_to daily_report_path(daily_report)
  end

end
