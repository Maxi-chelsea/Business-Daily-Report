class Facility::ItemsController < ApplicationController

  def index
    @items = Item.joins(:employee).where(employees: {company_name: current_employee.company_name, company_code: current_employee.company_code})
    @q = Item.ransack(params[:q])
    @item_all = @q.result
  end

  def show
    @item = Item.find(params[:id])
    @item_comment = ItemComment.new
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
    item = current_employee.items.new(item_params)
    item.employee_id = current_employee.id
    item.save
    redirect_to items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:facility_id, :title, :genre, :status, :content)
  end

end
