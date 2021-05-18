class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
  end

  def create
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
    params.require(:employee).permit(:email, :name, :is_deleted, :admin)
  end

end
