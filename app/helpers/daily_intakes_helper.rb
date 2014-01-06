module DailyIntakesHelper
  def self.key_in_db? key
    intake = DailyIntake.find_element(key)
    return false if intake.nil?
    true
  end
end
