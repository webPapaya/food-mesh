require 'singleton'
class IntakeCalculations
    include Singleton

    def initialize
      @daily_intakes = DailyIntake.all
      @valid_keys = parse_keys
    end

    def is_key_valid? (key)
      @valid_keys.include? key
    end

    def get_key (key)
      @valid_keys[key] if is_key_valid? key
    end

  private
  def parse_keys
    keys = {}
    @daily_intakes.each do |item|
      keys[item['key']] = item['value']
    end
    keys
  end
end
