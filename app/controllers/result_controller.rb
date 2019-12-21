class ResultController < ApplicationController
  def index
    @results = Event.all.where(match_order: 1).where("events.event_date < ?", Time.now)
              .order(event_date: :desc).page(params[:page]).per(6)
    
  end
  
  def eventtype
    @result = Event.find_by(event_type: params[:event_type])
    @results = Event.all.where(match_order: 1, event_type: params[:event_type]).where("events.event_date < ?", DateTime.now)
              .order(event_date: :desc).page(params[:page]).per(6)
    
  end
  
  def show
    @result = Event.find_by(event_name: params[:event_name])
    
    @results = Event.all.where(event_name: params[:event_name]).order(match_order: :asc)
    
  end
  
  
end
