Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }



  get "result/" => "result#index"  
  get "result/:event_type" => "result#eventtype"
  get "result/:event_type/:event_name" => "result#show"
  
  get "event/" => "event#index"
  get "event/:event_type" =>"event#eventtype"
  get "event/:event_type/:event_name" => "event#show"
  post "event/:event_name/:match_order/destroy" => "event#destroy"
  post "event/:event_name/:match_order/create_r" => "event#create_r"
  post "event/:event_name/:match_order/create_b" => "event#create_b"
  
  
  get "/" => "home#top"
  get "/contacts" => "home#contacts"
  get "/privacy_policy" => "home#privacy_policy"
  
  get "ranking/" => "ranking#index"
  
  get "mma/" => "mma#top"
  
  get "input/event" => "input#event"
  get "input/edit" => "input#edit_form"
  get "input/result" => "input#result_form"
  post "input/event/create" => "input#create"
  post "input/edit_match" => "input#edit_match"
  post "input/edit_order" => "input#edit_order"
  post "input/edit_event_name" => "input#edit_event_name"
  post "input/edit_other" => "input#edit_other"
  post "input/result" => "input#result"
  post "input/destroy" => "input#destroy"
  
  get "news/" => "news#index"
  get "news/create" => "news#create_form"
  get "news/:posting_time" => "news#article"
  get "news/:posting_time/edit" => "news#edit_form"
  post "news/create" => "news#create"
  post "news/:posting_time/edit" => "news#edit"
  
  get ":nickname/" => "mypage#user"
  get ":nickname/edit_user" => "mypage#edit_user"
  post ":nickname/update_user"=> "mypage#update_user"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
