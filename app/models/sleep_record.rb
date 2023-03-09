class SleepRecord < ApplicationRecord
  belongs_to :user
  before_update :calculate_sleep_length, if: :clocked_out?

  def clocked_out?
    self.clock_out.present?
  end

  def calculate_sleep_length
    self.sleep_length = (self.clock_out - self.clock_in) / 3600
  end
end
