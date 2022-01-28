class AttendancesController < ApplicationController
  
  before_action :set_user, only:  [:edit_one_month, :update_one_month, :edit_overwork_request, :edit_overwork_notice, :edit_one_month_apply]
  before_action :logged_in_user, only: [:update, :edit_one_month, :edit_overwork_request, :edit_overwork_notice]
  before_action :edit_correct_user, only: [:edit_one_month]
  #before_action :log_correct_user, only: [:edit_attendance_log]
  before_action :set_one_month, only: [:edit_one_month, :update_one_month]

  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"
  
  
  def index
    @search_params = attendance_search_params
    @users = Attendance.search(@search_params).includes(:month)
  end
  

  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    # 出勤時間が未登録であることを判定します。
    if @attendance.started_at.nil?
      if @attendance.update_attributes(started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます！"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @attendance.finished_at.nil?
      if @attendance.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした。"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end
  
  
  def edit_one_month
    user = User.find(params[:id])
    first_day = Date.current.beginning_of_month
    last_day = first_day.end_of_month
    @attendances = user.attendances.where(worked_on: first_day..last_day).order(:worked_on)
    @attendance_apply = User.where(id: 2..3).where.not(id: current_user)
  end
  
  def update_one_month
    #binding.pry
    ActiveRecord::Base.transaction do # トランザクションを開始します。
    attendances_params.each do |id, item|
      #binding.pry
    #if item[:renewed_started_at] == "" || item[:started_at] == "" && item[:renewed_finished_at] == "" || item[:finished_at] == "" && item[:description] != "" && item[:superior_choice_id] != "" && item[:tomorrow] == true || item[:tomorrow] == false
    if item[:renewed_started_at] == "" && item[:renewed_finished_at] == "" && item[:description] != "" && item[:superior_choice_id] != "" && item[:tomorrow] != ""
      next
    end
     if item[:renewed_started_at].present? && item[:renewed_finished_at].blank?
      flash[:danger] = "出勤時間のみの勤怠変更はできません"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
     end
     if item[:renewed_started_at].blank? && item[:renewed_finished_at].present?
      flash[:danger] = "退勤時間のみの勤怠変更はできません"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
     end
     if item[:renewed_started_at].present? && item[:renewed_finished_at].present? && item[:superior_choice_id] == "" && item[:description] == ""
      flash[:danger] = "備考・指示者確認㊞を入力してください。"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
     end
     if item[:superior_choice_id] != "" && item[:description] != "" && item[:renewed_started_at] == "" && item[:renewed_finished_at] == ""
      flash[:danger] = "出勤時間・退勤時間を入力してください。"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
     end
     
     if item[:superior_choice_id].present? && item[:description].blank?
      flash[:danger] = "備考の記載がありません。"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
     end
     if item[:superior_choice_id].blank? && item[:description].present?
      flash[:danger] = "指示者確認㊞が選択されていません。"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
     end
     #if item[:description] == "" && item[:superior_choice_id].present?
      #flash[:danger] = "備考が入力されていない為勤怠変更に失敗しました。"
       #redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
     #end
      if item[:superior_choice_id] == "" && item[:description] != ""
       flash[:danger] = "指示者確認が選択されていない為勤怠変更に失敗しました。"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
      end
      
      if item[:renewed_started_at].present? && item[:renewed_finished_at].blank?
      flash[:danger] = "出勤時間のみの勤怠変更はできません"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
      end
      if item[:renewed_started_at].blank? && item[:renewed_finished_at].present?
      flash[:danger] = "退勤時間のみの勤怠変更はできません"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
      end
      
      if item[:started_at].present? && item[:finished_at].blank?
      flash[:danger] = "出勤時間のみの勤怠変更はできません"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
      end
      if item[:started_at].blank? && item[:finished_at].present?
      flash[:danger] = "退勤時間のみの勤怠変更はできません"
       redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
      end
      #if attendance.renewed_started_at > attendance.renewed_finished_at && item[:tomorrow] == true
      #flash[:danger] = "出勤時間より早い退勤時間は無効です。"
       #redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
      #end

      attendance = Attendance.find_by(id: id)
      if attendance.attendance_state == 2 #承認
        attendance.attributes = item
       if attendance.has_changes_to_save?
         attendance.attendance_state = 1 #申請中
         #attendance.tomorrow = false
         attendance.save!
       end
      else
        attendance.attendance_state = 1
        attendance.update!(item)
      end
      #binding.pry
   end
  end
  flash[:success] = "勤怠変更を申請しました。"
  redirect_to user_url(date: params[:date])
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
   flash[:danger] = "出勤時間より早い退勤時間は無効です。"
   redirect_to attendances_edit_one_month_user_url(date: params[:date]) and return
  end
  
  def edit_overwork_request
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    @current_user = User.find(params[:user_id])
    @over_apply = User.where(id: 2..3).where.not(id: current_user)
  end
   
   
  def update_overwork_request
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    @attendance.attributes = update_overwork_request_params
    if @attendance.save(context: :update_overwork_request)
      flash[:success] = "残業を申請しました。"
      redirect_to user_url(@user)
    else
      #if @attendance.finish_time
      flash[:danger] = "残業申請に失敗しました。"
      redirect_to user_url(@user)
    end
  end
  

  def request_one_month_application
    @user = User.find(params[:id])
    @attendance = @user.attendances.find_by(worked_on: params[:date])
    params[:user][:one_month_superior_status] = "申請中"
    @attendance.update(request_one_month_application_params)
    #binding.pry
    flash[:success] = "１カ月の勤怠申請しました。"
    redirect_to user_url(@user)
  end
  
  def edit_one_month_apply
    #@first_day = Date.current.beginning_of_month
    #@users = User.where.not(id: 1).where.not(id: current_user.id)
    @user = User.find(params[:id])
    @attendances = Attendance.where(one_month_superior_status: '申請中', one_month_status: 1, one_month_superior: @user.id).order(user_id: "ASC").group_by(&:user_id)
  end
  
  def update_one_month_apply
    ActiveRecord::Base.transaction do # トランザクションを開始します。
      update_one_month_apply_params.each do |id, item|
        if ActiveRecord::Type::Boolean.new.cast(item[:change_month]) && item[:one_month_status] == "2"
          attendance = Attendance.find(id)
          attendance.update!(one_month_status: item[:one_month_status])
        end
        if ActiveRecord::Type::Boolean.new.cast(item[:change_month]) && item[:one_month_status] == "1"
          flash[:danger] = "指示者確認㊞ステータスを変更してください。"
          redirect_to user_path(current_user) and return
        end
        if ActiveRecord::Type::Boolean.new.cast(item[:change_month]) && item[:one_month_status] == "3"
          attendance = Attendance.find(id)
          attendance.update!(one_month_superior_id: nil,  one_month_superior_status: nil, one_month_status: 3)
          flash[:info] = "１カ月分の勤怠を否認しました。"
           redirect_to user_path(current_user) and return
        end
        if ActiveRecord::Type::Boolean.new.cast(item[:change_month]) && item[:one_month_status] == "4"
          attendance = Attendance.find(id)
          attendance.update!(one_month_superior_id: nil,  one_month_superior_status: nil, one_month_status: 4)
          flash[:info] = "１カ月分の勤怠を削除しました。"
           redirect_to user_path(current_user) and return
        end
      end
    end
    flash[:success] = "１カ月分の勤怠を承認しました。"
    redirect_to user_path(current_user) and return
    
  end
  
  def edit_attendance_apply
    #@users = User.where.not(id: 1).where.not(id: current_user.id).joins(:attendances).preload(:attendances).distinct
    @users = User.where.not(id: 1).where.not(id: current_user.id).eager_load(:attendances).where.not(attendances: {renewed_finished_at: nil}).where(attendances: {superior_choice: current_user.id}).where(attendances: {attendance_state: 1})
    #binding.pry
    @user = User.find(params[:id])
    @attendances = @user.attendances
    @attendance = Attendance.find(params[:id])
    #@attendance_apply = User.where(id: 2..3).where.not(id: current_user)
  end
  
  def update_attendance_apply
    ActiveRecord::Base.transaction do # トランザクションを開始します。
    #binding.pry
        update_atendance_apply_params.each do |id, item|
          attendance = Attendance.find(id)
          #binding.pry
          if ActiveRecord::Type::Boolean.new.cast(item[:change_shift]) && item[:attendance_state] == "2"
            
            
            AttendanceChangeApprovalLog.create!(worked_on: attendance.worked_on,
                                               started_at: attendance.started_at,
                                               finished_at: attendance.finished_at,
                                               renewed_started_at: attendance.renewed_started_at,
                                               renewed_finished_at: attendance.renewed_finished_at,
                                               approval_date: Date.today,
                                               user_id: attendance.user_id,
                                               approval_user_id: attendance.superior_choice_id
            )
            attendance.update!(started_at: attendance.renewed_started_at,
                               finished_at: attendance.renewed_finished_at,
                               renewed_started_at: nil,
                               renewed_finished_at: nil,
                               attendance_state: item[:attendance_state],
                               change_shift: item[:change_shift]
            )
            #binding.pry
          end
          if ActiveRecord::Type::Boolean.new.cast(item[:change_shift]) && item[:attendance_state] == "1"
            flash[:danger] = "指示者確認㊞ステータスを変更してください。"
            redirect_to user_path(current_user) and return
          end
          
          if ActiveRecord::Type::Boolean.new.cast(item[:change_shift]) && item[:attendance_state] == "3"
            attendance = Attendance.find(id)
            attendance.update!(superior_state: nil, change_shift: nil, description: nil, attendance_state: 3,
                               renewed_started_at: nil, renewed_finished_at: nil, superior_choice_id: nil
            )
            flash[:info] = "勤怠申請を否認しました。"
            redirect_to user_path(current_user) and return
          end
          
          if ActiveRecord::Type::Boolean.new.cast(item[:change_shift]) && item[:attendance_state] == "4"
            attendance = Attendance.find(id)
            attendance.update!(superior_state: nil, change_shift: nil, description: nil, attendance_state: 4,
                               renewed_started_at: nil, renewed_finished_at: nil, tomorrow: nil, superior_choice_id: nil
            )
            flash[:info] = "勤怠申請を削除しました。"
            redirect_to user_path(current_user) and return
          end
        end
    end
    flash[:success] = "勤怠申請を承認しました。"
    redirect_to user_path(current_user) and return
  end
  
  
  def edit_attendance_log
    @logs = Attendance.where(attendance_state: 2)
    @user = User.find(params[:id])
    #binding.pry
  end

     
  private
  
  def attendances_params
    #binding.pry
    params.permit(attendances: [:started_at, :finished_at, :renewed_started_at, :renewed_finished_at, :tomorrow, :description, :superior_choice_id]).merge(attendance_state: 1)[:attendances]
  end
   
  def update_one_month_params
    params.require(:attendance).permit(:renewed_started_at, :renewed_finished_at, :tomorrow, :superior_state, :description, :superior_choice_id).merge(one_month_status: 2)
  end
  
  def update_overwork_request_params
    params.require(:attendance).permit(:finish_time, :next_day_check, :contents, :select_superior_id).merge(superior_state: 1)
  end
  

  def update_atendance_apply_params
    params.require(:user).permit(attendances: [:superior_state, :change_shift, :description, :attendance_state])[:attendances]
  end
  
  def request_one_month_application_params
    params.require(:user).permit(:one_month_superior_id, :one_month_superior_status).merge(one_month_status: 1)
  end
  
  def update_one_month_apply_params
    params.require(:user).permit(attendances: [:one_month_status, :change_month])[:attendances]
  end
  
  def edit_correct_user
    unless current_user?(@user)
      flash[:danger] = "編集権限がありません。"
      redirect_to user_path(@user)
    end
  end
  
  def log_correct_user
    unless current_user?(@user)
      flash[:danger] = "閲覧権限がありません。"
      redirect_to root_url
    end
  end
  
  def attendance_search_params
    params.fetch(:search, {}).permit(:year, :month)
  end
  
  
end
