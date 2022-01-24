require 'csv'

class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :show2, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info, :edit_attendance_log]
  #before_action :correct_user, only: [:edit, :update]
  before_action :admin_or_correct_user, only: [:show, :edit, :index, :update, :edit_one_month, :update_one_month, :edit_attendance_log]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: [:show, :show2]
  before_action :superior_user, only: [:show2]

  def index
    #binding.pry
    #if params[:search] == ""
    #@users = User.where(params[:search])
    #end
  
    @users =  User.all
    
    @users = @users.where('name LIKE?', "%#{params[:search]}%") if params[:search].present?
    #respond_to do |format|
        #format.html
        #format.csv do |csv|
         #send_users_csv(@users)
        #end
    #end
  end
  
  def search
    if params[:search] != ""
     @users = User.search(params[:search])
    else
     @users = User.all
    end
    binding.pry
  end
  
  #def send_users_csv(users)
    #bom = "\uFEFF"
    #csv_data = CSV.generate(bom) do |csv|
      #header = %w(ユーザー名 メールアドレス 所属 社員番号 カードID 基本勤務時間  指定勤務開始時間 指定勤務終了時間 上長フラグ 管理者フラグ パスワード)
      #header = %w(name email affiliation employee_number uid designated_work_start_time designated_work_end_time superior admin password)
      #csv << header
      #users.each do |user|
        #values = [user.name, user.email, user.affiliation, user.employee_number, user.uid, user&.designated_work_start_time&.strftime('%H:%M'), user&.designated_work_end_time&.strftime('%H:%M'), user.superior, user.admin, user.password]
        #csv << values
      #end
      
    #end
    #send_data(csv_data, filename: "ユーザー情報一覧.csv")
  #end
  
  #def import
    #if params[:csv_file].blank?
      #redirect_to(user_url)
    #else
      #num = Admin::User.import(params[:csv_file])
      #redirect_to(users_url, notice: "#{num.to_s}の件のユーザー情報を追加・更新しました")
    #end
  #end
  
  def import
    User.import(params[:file])
    flash[:success] = "新規ユーザーを追加しました。"
    redirect_to users_url
  end
  
  def applicants
   @working_in_users = User.includes(:attendances)
  end

  def show
    #binding.pry
   @user = User.find(params[:id])
   #@attendance = @user.attendances.find_by(worked_on: Date.today)
   #if @user == current_user || current_user.admin?
    #@first_day = Date.current.beginning_of_month
   #@last_day = @first_day.end_of_month(@first_day..@last_day).each do |day| unless @user.attendances.any? {|attendance| attendance.worked_on == day}
    #record = @user.attendances.build(worked_on: day)
    #record.save
     #end
    #end
   #@dates =user.attendances_month_date
   user = User.find(params[:id])
    @first_day = params[:date]&.to_date || Date.current.beginning_of_month
    @last_day = @first_day.end_of_month
    @attendances = user.attendances.where(worked_on: @first_day..@last_day).order(:worked_on)
    @one_month_apply_count = Attendance.where(one_month_superior_id: current_user.id).where(one_month_status: 1).count
    #binding.pry
    @apply_attendances_count = Attendance.where.not(renewed_finished_at: nil).where(superior_choice_id: current_user.id).where(attendance_state: 1).count
    #binding.pry
    @overwork_time_count =  Attendance.where.not(contents: nil).where(select_superior_id: current_user.id).where(superior_state: 1).count
    #binding.pry
    @worked_sum = @attendances.where.not(started_at: nil).count
    @superiors = User.where(superior: true).where.not(id: current_user)
    @attendance = Attendance.find(params[:id])
    @over_apply = User.where(superior: true).where.not(id: current_user)
    @attendance_apply = User.where(superior: true).where.not(id: current_user)
    @beginning_of_month_attendance = user.attendances.find_by(worked_on: @first_day)
   #binding.pry
   #else
     #redirect_to root_url
   #end
   respond_to do |format|
        format.html
        format.csv do |csv|
         send_attendances_csv(@attendances)
        end
    end
  end
  
  
   def send_attendances_csv(attendances)
    bom = "\uFEFF"
    csv_data = CSV.generate(bom) do |csv|
      #header = %w(day.worked_on attendance.worked_on.wday started_at finished_at)
      header = %w(日付 曜日 出勤時間  退勤時間)
      csv << header
      @attendances.each do |attendance|
        #binding.pry
        if attendance.started_at.present? && attendance.finished_at.present? && attendance.attendance_state == 1 
            values = [l(attendance.worked_on, format: :short), $days_of_the_week[attendance.worked_on.wday], attendance&.started_at&.strftime('%H:%M'), attendance&.finished_at&.strftime('%H:%M')]
            csv << values
        else if attendance.started_at.present? && attendance.finished_at.present? && attendance.attendance_state == 2
            values = [l(attendance.worked_on, format: :short), $days_of_the_week[attendance.worked_on.wday], attendance&.started_at&.strftime('%H:%M'), attendance&.finished_at&.strftime('%H:%M')]
            csv << values
        else
            values = [l(attendance.worked_on, format: :short), $days_of_the_week[attendance.worked_on.wday]]
            csv << values
        end
        end
      end
    end
    send_data(csv_data, filename: "勤務実績.csv")
   end
   #@overtime = Attendance.where(indicator_reply: "申請中", indicator_check: @user.name).count
  
  def show2
    #@user = User.where.not(id: current_user.id)
    user = User.find(params[:id])
    @first_day = params[:date]&.to_date || Date.current.beginning_of_month
    @last_day = @first_day.end_of_month
    @attendances = user.attendances.where(worked_on: @first_day..@last_day).order(:worked_on)
    @worked_sum = @attendances.where.not(started_at: nil).count
    @beginning_of_month_attendance = user.attendances.find_by(worked_on: @first_day)
   #@overtime = Attendance.where(indicator_reply: "申請中", indicator_check: @user.name).count
  end
  
  def new
    if logged_in? && !current_user.admin?
     flash[:warning] = "すでにログインしています。"
     redirect_to current_user
    end
     @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      (Date.parse('2021-01-01')..Date.parse('2022-12-31')).select{|d| d.day == 1}.each do |day|
        first_day = day
        #first_day = Date.current.beginning_of_month
        last_day = first_day.end_of_month
        one_month = [*first_day..last_day]
        one_month.each {|day| @user.attendances.create!(worked_on: day)}
      end
      flash[:success] = '新規作成に成功しました。'
      log_in @user
      redirect_to @user
      # 保存に成功した場合は、ここに記述した処理が実行されます。
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  #def edit2
    #@user = User.find(params[:id])
  #end
  
  
  def update
    #binding.pry
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:success] = "ユーザー情報を更新しました。"
      if current_user.admin?
       redirect_to users_path
      else
       redirect_to user_path(@user)
      end
    else
      #if current_user.admin?
       #render :edit2
      #else
       render :edit
      #end
    end
  end
  
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def edit_basic_info
  end
  

  def update_basic_info
   if @user.update_attributes(basic_info_params)
     flash[:success] = "#{@user.name}の基本情報を更新しました。"
   else
     flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
   end
     redirect_to users_url
  end
  
  def edit_overwork_notice
    @users = User.where.not(id: 1).where.not(id: current_user.id).eager_load(:attendances).where.not(attendances: {contents: nil}).where(attendances: {select_superior_id: current_user.id}).where(attendances: {superior_state: 1})
    #binding.pry
    @user = User.find(params[:id])
    @attendances = @user.attendances
    @attendance = Attendance.find(params[:id])
  end
  
  def update_overwork_notice
     #@user = User.where(id: 7)
     #@attendance = Attendance.where(id: 4..13)
      ActiveRecord::Base.transaction do # トランザクションを開始します。
        update_overwork_notice_params.each do |id, item|
          if ActiveRecord::Type::Boolean.new.cast(item[:modification]) && item[:superior_state] == "2"
            attendance = Attendance.find(id)
            attendance.update_attributes!(item)
          end
          if ActiveRecord::Type::Boolean.new.cast(item[:modification]) && item[:superior_state] == "1"
            flash[:danger] = "指示者確認㊞ステータスを変更してください。"
            redirect_to user_path(current_user) and return
          end
          if ActiveRecord::Type::Boolean.new.cast(item[:modification]) && item[:superior_state] == "3"
            attendance = Attendance.find(id)
            attendance.update_attributes!(finish_time: nil, next_day_check: nil, contents: nil, 
                                          modification: nil, select_superior_id: nil, superior_state: 3
            )
            flash[:info] = "残業申請を否認しました。"
            redirect_to user_path(current_user) and return
          end
          if ActiveRecord::Type::Boolean.new.cast(item[:modification]) && item[:superior_state] == "4"
            attendance = Attendance.find(id)
            attendance.update_attributes!(finish_time: nil, next_day_check: nil, contents: nil, 
                                          modification: nil, select_superior_id: nil, superior_state: 4
            )
            flash[:info] = "残業申請を削除しました。"
            redirect_to user_path(current_user) and return
          end
        end
      end
      flash[:success] = "残業申請を承認しました。"
      redirect_to user_path(current_user) and return
  end
  
  
  private
    def user_params
     params.require(:user).permit(:name, :email, :affiliation, :employee_number, :uid, :password, :basic_time, :designated_work_start_time, :designated_work_end_time)
    end
    
    def attendances_params
     params.require(:attendance).permit(:day.worked_on, :started_at, :finished_at)
    end
    
    def update_overwork_notice_params
     params.require(:user).permit(attendances: [:finish_time, :next_day_check, :contents, :superior_state, :modification])[:attendances]
    end
   
    def basic_info_params
     params.require(:user).permit(:basic_time, :work_time)
    end
    
    
    def admin_or_correct_user
     unless current_user?(@user) || current_user.admin?
       #binding.pry
       flash[:danger] = "編集権限がありません。"
       redirect_to(root_url)
     end
    end
    
    #def correct_user
      #redirect_to(root_url) unless current_user?(@user)
    #end
    
    
    
    
    def superior_user
     unless current_user.superior? && !current_user?(@user)
        flash[:danger] = "確認権限がありません。"
        redirect_to user_path(@user) and return
     end
    end

end
