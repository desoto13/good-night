Rails.application.routes.draw do
 
  # Following and unfollowing a friend
  post '/users/:user_id/follow', to: "users#follow", as: "follow_user"
  post '/users/:user_id/unfollow', to: "users#unfollow", as: "unfollow_user"
end
