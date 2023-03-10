Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Following and unfollowing a friend
      post '/users/:user_id/follow', to: "users#follow", as: "follow_user"
      post '/users/:user_id/unfollow', to: "users#unfollow", as: "unfollow_user"
      
      # Recording clock in and clock out
      post 'sleep-records/time-keep', to: "sleep_records#time_keeping", as: "time_keeping"
      # Return all clocked-in times of a user, ordered by created time
      get 'sleep-records/my-record', to: "sleep_records#index", as: "my_sleep_records"

      # Return all friends sleep records in the past week ordered by sleep length
      get '/friends-records', to: "users#friends_record", as: "friends_record_past_week"
    end
  end
end
