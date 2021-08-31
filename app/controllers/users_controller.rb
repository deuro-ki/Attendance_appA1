class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_or_correct_user, only: [:show, :edit, :index, :update, :edit_one_month, :update_one_month]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: :show

  def index
    @users = if params[:search]
    User.paginate(page: params[:page]).where('name LIKE?', "%#{params[:search]}%")
   else
    User.paginate(page: params[:page])
   end
  end

  def show
   @worked_sum = @attendances.where.not(started_at: nil).count
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
  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
     flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def edit_basic_info
    @user = User.find_by(id: params[:id])
  end

   def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
     redirect_to users_url
   end


  private
   def user_params
    params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
   end
   

    def basic_info_params
     params.require(:user).permit(:department, :basic_time, :work_time)
    end
    
    def admin_or_correct_user
    end






end
