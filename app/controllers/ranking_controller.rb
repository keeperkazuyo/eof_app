class RankingController < ApplicationController
  def index
    
    @points = Cheer.joins(:user).group("users.nickname").having('count_point > 0').order('count_point DESC').count(:point)
    
    
  
  end
end
