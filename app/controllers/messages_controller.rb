class MessagesController < ApplicationController
  def index
    @employee = Employee.find(params[:employee_id])
    send_ids = current_employee.messages.where(receive_employee_id: @employee.id).pluck(:id)
    receive_ids = @employee.messages.where(receive_employee_id: current_employee.id).pluck(:id)
    @messages = Message.where(id: send_ids + receive_ids).order(created_at: :desc)
    @message = Message.new
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @message = current_employee.messages.build(message_params)
    @message.receive_employee_id = @employee.id
    if @message.save
      flash[:success] = 'メッセージを送信しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'メッセージを送信できませんでした。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
