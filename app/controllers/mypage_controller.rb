class MypageController < ApplicationController
  before_action :authenticate_user, {only:[:edit_user,:update_user]}
  before_action :ensure_correct_user,{only:[:edit_user,:update_user]}
  
  
  def user

    @user = User.find_by(nickname: params[:nickname])
    
    @which_cheer = Cheer.where(user_id: @user.id).count
    
    @point = Cheer.where(user_id: @user.id, point: 1).count
  end



  def edit_user
    @user = User.find_by(nickname: params[:nickname])
  end
  
  
  
  def update_user
    @user = User.find_by(nickname: params[:nickname])
    @user.name = params[:name]
    if @user.save
      flash[:notice] = "名前を変更しました"
      redirect_to("/#{@user.nickname}")
    else
      flash[:alert] = "名前を入力してください"
      render("mypage/edit_user")
    end
  end
  
  def ensure_correct_user
    if current_user.nickname != params[:nickname]
      flash[:alert] = "権限がありません"
      redirect_to("/")
    end
  end
  
  
end
