module Api
  module V1
    class SleepRecordsController < ApplicationController
      before_action :set_current_user

      def index
        @records = @current_user.sleep_records.order("created_at DESC")
      end

      def time_keeping
        @record = @current_user.sleep_records.last

        if @record.nil? || @record.clock_out.present?
          @record = @current_user.sleep_records.create(clock_in: DateTime.now.strftime("%Y-%m-%d %H:%M:%S"))
        else
          @record.update(clock_out: DateTime.now.strftime("%Y-%m-%d %H:%M:%S"))
        end
        
      end

      private

      def set_current_user
        @current_user = User.find(params[:id])
      end
      
    end
  end
end
    
