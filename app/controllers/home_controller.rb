class HomeController < ApplicationController
  
  
  
  def top
    @events = Event.where(match_order:1).where("events.event_date > ?", Time.now).order(event_date: :asc)
    
    @results = Event.where(match_order:1).where("events.event_date < ?", Time.now).order(event_date: :desc)
    
    @points = Cheer.joins(:user).group("users.nickname").having('count_point > 0').order('count_point DESC').count(:point)
    
    @news = News.all.order(created_at: :desc)
  end
  
  def contacts
    
  end
  
  def privacy_policy
    
  end
end
