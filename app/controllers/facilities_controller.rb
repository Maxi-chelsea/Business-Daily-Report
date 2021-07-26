class FacilitiesController < ApplicationController

  before_action :set_q, only: [:index, :search]

  def index
    @facilities = Facility.joins(:employee).where(employees: { company_name: current_employee.company_name, company_code: current_employee.company_code })
    @q = Facility.ransack(params[:q])
    @facilities_all = @q.result
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def new
    @facility = Facility.new
  end

  def create
    facility = Facility.new(facility_params)
    facility.employee_id = current_employee.id
    facility.genre = params[:facility][:genre].to_i
    if facility.save
      flash.notice = 'メッセージを送信しました。'
      redirect_to facility_path(facility)
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    @facility.update(facility_params)
    redirect_to facility_path(@facility)
  end

  def search
    @results = @q.result.joins(:employee).where(employees: { company_name: current_employee.company_name, company_code: current_employee.company_code })
  end

  private

  def set_q
    @q = Facility.ransack(params[:q])
  end

  def facility_params
    params.require(:facility).permit(:id, :name, :postalcode, :address, :latitude, :longitude, :responsible_person)
  end

  def params_int(facility_params)
    facility_params.each do |key, value|
      facility_params[key] = value.to_i if integer_string?(value)
    end
  end
end
