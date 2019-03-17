class Zoo

  attr_reader :cages, :employees

  def initialize(name,season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    10.times {@cages << Cage.new}
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    date >= @season_opening_date && date <= @season_closing_date
  end

  def add_animal(animal)
    animal_added = false
    @cages.each_with_index do |cage, index|
      if cage.empty?
        @cages[index].animal = animal
        animal_added = true
        break
      end
    end
    if animal_added == false
      "Your zoo is already at capacity!"
    end
  end

  def visit
    greet = ""
    @employees.each do |employee|
      greet += "#{employee.greet}\n"
    end
    @cages.each do |cage|
      if not cage.empty?
        greet += "#{cage.animal.speak}\n"
      end
    end
    greet
  end
end
