class DailyReport::DailyReportsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @daily_reports = DailyReport.joins(:employee).where(employees: { company_name: current_employee.company_name, company_code: current_employee.company_code })
    @daily_reports_all = @daily_reports.all.order(created_at: :desc)
  end

  def show
    @daily_report = DailyReport.find(params[:id])
    @daily_report_comment = DailyReportComment.new
  end

  def new
    @employee = current_employee
    @facilities = @employee.facilities
    @facilities_hash = {}
    @facilities.each do|facility|
      @facilities_hash[facility.name] = facility.id
    end
    @daily_report = DailyReport.new
  end

  def create
    daily_report = current_employee.daily_reports.new(daily_report_params)
    daily_report.employee_id = current_employee.id
    daily_report.score = Language.get_data(daily_report_params[:content])
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
    @facilities.each do|facility|
      @facilities_hash[facility.name] = facility.id
    end
  end

  def update
    @daily_report = DailyReport.find(params[:id])
    @daily_report.score = Language.get_data(daily_report_params[:content])
    @daily_report.update(daily_report_params)
    redirect_to daily_report_path(@daily_report)
  end

  def destroy
    daily_report = DailyReport.find(params[:id])
    daily_report.destroy
    redirect_to daily_reports_path
  end

  def search
    @results = @q.result.joins(:employee).where(employees: { company_name: current_employee.company_name, company_code: current_employee.company_code })
  end

  private

  def set_q
    @q = DailyReport.ransack(params[:q])
  end

  def daily_report_params
    params.require(:daily_report).permit(:facility_id, :title, :time, :person, :content)
  end
end
