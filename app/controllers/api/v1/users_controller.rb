module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_current_user
    
      def follow
        friend = User.find(params[:user_id])
        if @current_user.followees.include?(friend)
          render json: { error: "#{@current_user.name} is already following #{friend.name}" }, status: 401
        else
          @current_user.followees << friend
          render json: { notice: "#{@current_user.name} has followed #{friend.name}" }, status: 200
        end
      end
    
      def unfollow
        friend = User.find(params[:user_id])
        if @current_user.followed_users.exists?(followee_id: friend.id)
          @current_user.followed_users.find_by(followee_id: friend.id).destroy
          render json: { notice: "#{@current_user.name} has unfollowed #{friend.name}" }, status: 200
        else
          render json: { error: "#{@current_user.name} is not following #{friend.name}" }, status: 401
        end
      end
    
      private
    
      def set_current_user
        @current_user = User.find(params[:id])
      end
      
    end
  end
end


