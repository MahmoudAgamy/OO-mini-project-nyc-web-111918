class Ingredient
  attr_reader :name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name

    @@all << self
  end

  def myAllergens
    Allergen.all.select{|allergen| allergen.ingredient == self}
  end

  def self.most_common_allergen
    # loop on all Ingredients instances, then get their allergens
    # [ [ing1_allergens_arr], [ing2_allergens_arr]..., [ingx_allergens_arr] ]
    # sort new array by its length (the number of allergens)
    # then access last array (the longest)
    # and access any of them and returning its ingredient
    ingredient_allergen = @@all.map {|ingredient| ingredient.myAllergens }
    ing_sorted = ingredient_allergen.sort_by{|allergen| allergen.length}
    ing_sorted[-1][0].ingredient
  end
end # End of the class
