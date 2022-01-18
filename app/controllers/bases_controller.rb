class BasesController < ApplicationController

  
  def index
    @bases = Base.all.order(base_number: :ASC)
  end
  
  def edit
    @base = Base.find(params[:id])
  end
  
  def new_base_info
  end
  
  def new
    @base = Base.new
  end
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = "拠点#{@base.base_name}の情報を追加しました。"
      redirect_to bases_url
    else
      flash.now[:danger] = "拠点#{@base.base_name}の情報追加に失敗しました。"
      redirect_to bases_url
    end
  end
  
  def destroy
    @base = Base.find(params[:id])
    @base.destroy
    flash[:success] = "拠点#{@base.base_name}のデータを削除しました。"
    redirect_to bases_url
  end
  
  def update
    @base = Base.find(params[:id])
    if @base.update_attributes(edit_base_params)
      flash[:success] = "拠点#{@base.base_name}の情報を更新しました。"
      redirect_to bases_url
    else
      flash.now[:danger] = "拠点情報の更新に失敗しました。"
      render :edit
    end
  end


  private
  
    def base_params
      params.permit(:base_number, :base_name, :base_status)
    end
    
    def edit_base_params
      params[:base].permit(:base_number, :base_name, :base_status)
    end
end

