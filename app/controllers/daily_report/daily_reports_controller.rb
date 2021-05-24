class DailyReport::DailyReportsController < ApplicationController

  def index
    @daily_reports = DailyReport.all
  end

  def show
    @daily_report = DailyReport.find(params[:id])
    @daily_report_comment = DailyReportComment.new
  end

  def new
    @employee = current_employee
    @facilities = @employee.facilities
    @facilities_hash = {}
    @facilities.each {|facility|
      @facilities_hash[facility.name] = facility.id
    }
    @daily_report = DailyReport.new

  end

  def create
    daily_report = current_employee.daily_reports.new(daily_report_params)
    daily_report.employee_id = current_employee.id
    daily_report.save
    redirect_to daily_reports_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def daily_report_params
    params.require(:daily_report).permit(:facility_id, :time, :person, :content)
  end

end
