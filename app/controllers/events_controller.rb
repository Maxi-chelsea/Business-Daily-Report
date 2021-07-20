class EventsController < ApplicationController
  def create
    event = Event.new(event_params)
    event.save!
    @events = Event.where(employee_id: current_employee.id)
  end

  def update
    event = Event.find(params[:id])
    @events = Event.where(employee_id: current_employee.id)
    event.update(event_params)
  end

  def destroy
    @employee = Employee.find(params[:id])
    event = Event.find(params[:id])
    event.destroy
    redirect_to employee_path(@employee)
  end

  private

  def event_params
    params.require(:event).permit(:title, :start, :end, :user_id, :body)
  end
end
