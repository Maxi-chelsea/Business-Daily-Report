class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    @q = Employee.ransack(params[:q])
    @employees_all = @q.result
  end

  def show
    @employee = Employee.find(params[:id])
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
    @employee.is_deleted = true #削除フラグを立て論理削除
    @employee.save
    respond_to do |format|
      format.html { redirect_to facilities_path, notice: 'Conversation was successfully destroyed.' }
    end
  end


  private
  def employee_params
    params.require(:employee).permit(:email, :password, :name)
  end

end
