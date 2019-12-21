class EventController < ApplicationController
  

  
  def index
    @events = Event.limit(5).where(match_order: 1).where("events.event_date > ?", DateTime.now)
              .order(event_date: :asc).page(params[:page]).per(6)
  end
  
  def eventtype
    @event = Event.find_by(event_type: params[:event_type])
    @events = Event.all.where(match_order: 1, event_type: params[:event_type]).where("events.event_date > ?", DateTime.now)
              .order(event_date: :asc).page(params[:page]).per(6)
    
  end
  
  def show
    @event = Event.find_by(event_name: params[:event_name])
    
    @events = Event.all.where(event_name: params[:event_name]).order(match_order: :asc)
    
  
  end
  
  def create_r
    @cheer_r = Cheer.new(user_id: current_user.id,
                         event_name: params[:event_name],
                         match_order: params[:match_order],
                         which_cheer:"r")
    @cheer_r.save
    flash[:notice] = "応援完了！"
    redirect_to("/event/rizin/#{@cheer_r.event_name}")
    
  end
  
  def create_b
    @cheer_b = Cheer.new(user_id: current_user.id, 
                         event_name: params[:event_name],
                         match_order: params[:match_order],
                         which_cheer:"b")
    @cheer_b.save
    flash[:notice] = "応援完了！"
    redirect_to("/event/rizin/#{@cheer_b.event_name}")  
  end
  
  def destroy
    @cheer = Cheer.find_by(user_id: current_user.id,
                           event_name: params[:event_name],
                           match_order: params[:match_order])
    @cheer.destroy
    flash[:notice] = "応援を取り消しました"
    redirect_to("/event/rizin/#{@cheer.event_name}")
  end
  
  
  
  
end
