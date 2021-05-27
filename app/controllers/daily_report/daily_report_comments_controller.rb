class DailyReport::DailyReportCommentsController < ApplicationController

  def create
    daily_report = DailyReport.find(params[:daily_report_id])
    comment = current_employee.daily_report_comments.new(daily_report_comment_params)
    comment.daily_report_id = daily_report.id
    # @post = comment.post
    comment.save
    # @post.create_notification_comment!(current_employee, daily_report_comment.id)
    redirect_to daily_report_path(daily_report)
  end

  def destroy
    DailyReportComment.find_by(id: params[:id], daily_report_id: params[:daily_report_id]).destroy
    redirect_to daily_report_path(params[:daily_report_id])
  end

  private

  def daily_report_comment_params
    params.require(:daily_report_comment).permit(:comment)
  end

end
