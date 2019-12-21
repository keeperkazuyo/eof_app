class ApplicationController < ActionController::Base
    def authenticate_user
        if current_user == nil
            flash[:alert] = "ログインが必要です。"
            redirect_to("/users/sign_in")
        end
    end
    
    
    def admin_user
        if current_user == nil || current_user.nickname != "fist_club2019"
          flash[:alert] = "権限がありません"
          redirect_to("/")
        end
    end
    

end
