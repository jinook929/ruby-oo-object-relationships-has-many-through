class Waiter
    @@all = []
    def self.all
        @@all
    end

    attr_accessor :name, :years
    def initialize(name, age)
        @name = name
        @years = years
        self.class.all.push(self)
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        self.meals.max {|meal_1, meal_2| meal_1.tip <=> meal_2.tip}.customer
        # tips = meals.collect {|meal| meal.tip}
        # meals[tips.index(tips.max)].customer
    end
end
