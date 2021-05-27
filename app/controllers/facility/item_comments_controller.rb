class Facility::ItemCommentsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    comment = current_employee.item_comments.new(item_comment_params)
    comment.item_id = item.id
    # @post = comment.post
    comment.save
    # @post.create_notification_comment!(current_employee, item_comment.id)
    redirect_to item_path(item)
  end

  def destroy
    ItemComment.find_by(id: params[:id], item_id: params[:item_id]).destroy
    redirect_to item_path(params[:item_id])
  end

  private

  def item_comment_params
    params.require(:item_comment).permit(:comment)
  end

end
