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
    if daily_report.save
      redirect_to daily_reports_path
    else
      render :new
    end
  end

  def edit
    @daily_report = DailyReport.find(params[:id])
    @facilities = current_employee.facilities
    @facilities_hash = {}
    @facilities.each {|facility|
      @facilities_hash[facility.name] = facility.id
    }
  end

  def update
    @daily_report = DailyReport.find(params[:id])
    @daily_report.update(daily_report_params)
    redirect_to daily_report_path(@daily_report)
  end

  def destroy
    daily_report = DailyReport.find(params[:id])
    daily_report.destroy
    redirect_to daily_reports_path
  end

  private

  def daily_report_params
    params.require(:daily_report).permit(:facility_id, :title, :time, :person, :content)
  end

end
