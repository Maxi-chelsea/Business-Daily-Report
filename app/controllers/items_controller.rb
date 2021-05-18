class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show

  end

  def new
    @employee = current_employee
    @facilities = @employee.facilities
    @facilities_hash = {}
    @facilities.each {|facility|
      @facilities_hash[facility.name] = facility.id
    }
 
    @item = Item.new

  end

  def create
    item = Item.new(item_params)
    item.employee_id = current_employee.id
    item.facility_id = @facilities_hash
    byebug
    item.save
    redirect_to items_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.permit(:id, :facility_id, :title, :genre, :status, :content)
  end

end
