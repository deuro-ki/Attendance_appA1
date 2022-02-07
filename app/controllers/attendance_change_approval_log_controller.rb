class AttendanceChangeApprovalLogController < ApplicationController
  
  def index
      if params[:year] == "" && params[:month] == ""
        flash[:danger] = "年月を選択してください。"
        redirect_to attendance_change_approval_log_index_path
        
      elsif params[:year] != "" && params[:month] == "" || params[:year] == "" && params[:month] != ""
        flash[:danger] = "年または月の選択がされていません。"
        redirect_to attendance_change_approval_log_index_path
        #binding.pry
        #from = "#{params[:year]}/#{params[:month]}/01".to_date
        #to = from.end_of_month
        #@attendance_change_approval_logs = current_user.attendance_change_approval_logs.where.not(worked_on: from..to)
      else
        from = "#{params[:year]}/#{params[:month]}/01".to_date
        to = from.end_of_month
        @attendance_change_approval_logs = current_user.attendance_change_approval_logs.where(worked_on: from..to).order(worked_on: 'ASC')
      #binding.pry
      end
  end
  
  
  private
  
  def search
    @attendance_change_approval_logs = Attendance_change_approval_logs.search(params[:search])
  end
end
