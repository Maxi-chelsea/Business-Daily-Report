class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show

  end

  def new
    @employee = current_employee
    @facilities = @employee.facilities
    @facilitie_hash = {}
    @facilities.each {|facility|
      @facilitie_hash[facility.name] = facility.id
    }

    @item = Item.new

  end

  def create
    item = Item.new(item_params)
    itme.employee_id = current_employee.id
    item.save
    if item.save
      flash.notice = 'メッセージを送信しました。'
      redirect_to items_path
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:title, :genre, :status, :content)
  end

end
