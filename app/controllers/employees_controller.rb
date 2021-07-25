class EmployeesController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  
  def index
    @employees = Employee.where(company_name: current_employee.company_name, company_code: current_employee.company_code)
    @employee_all = @employees.paginate(page: params[:page], per_page: 5)
    @q = Employee.ransack(params[:q])
    @employees_all = @q.result
  end

  def show
    @employee = Employee.find(params[:id])
    @events = Event.where(employee_id: @employee.id)
    @event = Event.new
    if current_employee.admin == true
      # 会社名と会社コードが一緒のデータのみを抽出するためにjoins及びwhereを使用
      @items = Item.joins(:employee).where(employees: { company_name: @employee.company_name, company_code: @employee.company_code })
      @daily_reports = DailyReport.joins(:employee).where(employees: { company_name: @employee.company_name, company_code: @employee.company_code }).order(created_at: :desc)
    else
      @items = @employee.items
      @daily_reports = @employee.daily_reports.order(created_at: :desc)
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    employee = Employee.new(employee_params)
    employee.save
    byebug
    redirect_to employees_path
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    employee = Employee.find(params[:id])
    employee.update(employee_params)
    redirect_to employee_path(employee.id)
  end

  def destroy
    @employee.is_deleted = true # 削除フラグを立て論理削除
    @employee.save
    respond_to do |format|
      format.html { redirect_to facilities_path, notice: 'Conversation was successfully destroyed.' }
    end
  end
  
  def search
    @results = @q.result.where(company_name: current_employee.company_name, company_code: current_employee.company_code)
  end

  private
  
  def set_q
    @q = Employee.ransack(params[:q])
  end
  

  def employee_params
    params.require(:employee).permit(:company_name, :company_code, :email, :password, :name)
  end
end
