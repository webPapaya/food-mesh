require 'singleton'
class IntakeCalculations
    include Singleton

    def initialize
        @daily_intakes = DailyIntake.all
        @valid_keys    = parse_keys
    end

    def is_key_valid? (key)
        @valid_keys.include? key
    end

    def get_key (key)
        @valid_keys[key] if is_key_valid? key
    end

    def get_smr (session)
        settings = session.get_user_settings
        smr = smr_man settings if (settings[:sex] == 'man')
        smr ||= smr_woman settings
        smr
    end

    private
    def parse_keys
        keys = {}
        @daily_intakes.each do |item|
            keys[item['key']] = item['value']
        end
        keys
    end

    ##
    # calculates the smr according to his settings
    def smr_man (settings)
        smr = 66.5 + (13.75 * settings[:weight].to_f)
        smr += (5.003 * settings[:height].to_f)
        smr - (6.775 * settings[:age].to_f)
    end

    #ä
    # Grundumsatz (kcal) = 655,1 + (9,563 x kg) + (1,850 x cm) – (4,676 x Alter)
    def smr_woman(settings)
        smr = 655.1 + (9.563 * settings[:weight].to_f)
        smr += (1.850 * settings[:height].to_f)
        smr - (4.676 * settings[:age].to_f)
    end
end
