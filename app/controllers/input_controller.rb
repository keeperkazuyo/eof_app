class InputController < ApplicationController
  before_action :admin_user
  
  def event
    
  end
  
  def create
    @new_event = Event.new(event_type: params[:event_type],
                           event_name: params[:event_name],
                           event_date: params[:event_date],
                           event_place: params[:event_place],
                           match_class: params[:match_class],
                           match_order: params[:match_order],
                           fighter_r: params[:fighter_r],
                           fighter_b: params[:fighter_b])
    if @new_event.save
      flash[:notice] = "登録完了！"
      @event_name = params[:event_name]
      @event_date = params[:event_date]
      @event_place = params[:event_place]
      @match_order = params[:match_order]
      render("input/event")
    else
      flash[:alert] = "未入力があるよ"
      @event_name = params[:event_name]
      @event_date = params[:event_date]
      @event_place = params[:event_place]
      @match_order = params[:match_order]
      
      render("input/event")
    end
  end
  
  def edit_form
    @event = Event.new
  end

  
  
  def edit_match
    @find_match = Event.find_by(event_name: params[:event_name],
                                 match_order: params[:match_order])
      @find_match.match_class = params[:match_class]
      @find_match.fighter_r = params[:fighter_r]
      @find_match.fighter_b = params[:fighter_b]
      if @find_match.save
        flash[:notice] = "変更完了しました"
        redirect_to("/input/edit")
      else
        flash[:alert] = "未入力があるよ"
        @event_name = params[:event_name]
        @match_order = params[:match_order]
        @match_class = params[:match_class]
        @fighter_r = params[:fighter_r]
        @fighter_b = params[:fighter_b]
        
        render("input/edit_form")
      end
  end
 
 
  def edit_order
    @find_order = Event.find_by(event_name: params[:event_name],
                                 match_order: params[:match_order])
      if @find_order
        @find_order.match_order = params[:edit_order]
        @find_order.save
        
      else
        flash[:alert] = "イベントが見つかりません"
        @event_name = params[:event_name]
        @match_order = params[:match_order]
        @edit_order = params[:edit_order]
        render("input/edit_form")
      end
    @which_cheer = Cheer.where(event_name: params[:event_name],
                               match_order: params[:match_order])
      if @which_cheer
        @which_cheer.update_all(match_order: params[:edit_order])
        flash[:notice] = "更新完了しました"
        redirect_to("/input/edit")
      else
        flash[:alert] = "応援している人がいません"
        @event_name = params[:event_name]
        @match_order = params[:match_order]
        @edit_order = params[:edit_order]
        render("input/edit_form")
      end
  end
 
 def edit_event_name
   @find_event = Event.where(event_name: params[:event_name])
   if @find_event
     @find_event.update_all(event_name: params[:edit_name])
   else
     flash[:alert] = "イベント名が存在しません"
     @event_name = params[:event_name]
     @edit_name = params[:edit_name]
     render("input/edit_form")
   end
   @which_cheer = Cheer.where(event_name: params[:event_name])
   if @which_cheer
     @which_cheer.update_all(event_name: params[:edit_name])
     flash[:notice] = "変更完了しました"
     redirect_to("/input/edit")
   else
     flash[:alert] = "応援している人がいません"
     @event_name = params[:event_name]
     @edit_name = params[:edit_name]
     render("input/edit_form")
   end
 end
 
 def edit_other
   @find_other = Event.where(event_name: params[:event_name])
   if @find_other.update_all(event_date: params[:event_date],
                            event_place: params[:event_place],
                            event_type: params[:event_type])
     flash[:notice] = "変更完了"
     redirect_to("/input/edit")
   else
     flash[:alert] = "イベントが見つからない、もしくは未入力があります"
     @event_name = params[:event_name]
     @event_date = params[:event_date]
     @event_place = params[:event_place]
     @event_type = params[:event_type]
     render("input/edit_form")
   end
   
 end
 
 def destroy
   @find_event = Event.find_by(event_name: params[:event_name])
   if @find_event
     @find_event.destroy
     flash[:notice] = "イベントを削除しました"
     redirect_to("/input/edit")
   else
     flash[:alert] = "イベントが見つかりません"
     render("input/edit_form")
     
   end
 end
 
 
  def result_form
   
  end
 
 
  def result
     @result = Event.find_by(event_name: params[:event_name],
                             match_order: params[:match_order])
      if @result
        @result.result = params[:result]
        @result.save
      else
        flash[:alert] = "イベントが見つからないよ"
        @event_name = params[:event_name]
        render("input/result")
      end
     @which_cheer = Cheer.where(event_name: params[:event_name],
                                match_order: params[:match_order],
                                which_cheer: params[:result])
      if @which_cheer
        @which_cheer.update_all(point: 1)
        @event_name = params[:event_name]
        flash[:notice] = "登録完了！"
        redirect_to("/input/result")
      else
        flash[:alert] = "イベントが存在しない、もしくは誰も応援していません"
        @event_name = params[:event_name]
        render("input/result")
      end
  end
 
 

end
