module ApplicationHelper
    def print_nutrition_element?(key)
        IntakeCalculations.instance.is_key_valid? key
    end

    def lala
        "lalalal"
    end
end
