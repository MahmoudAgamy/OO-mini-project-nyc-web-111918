class User
  attr_reader :name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name


    @@all << self
  end


  def myRCards
    Recipecard.all.select { |recipecard| recipecard.user == self}
  end

  def recipes
    myRCards.map {|card| card.recipe}
  end

  def add_recipe_card(recipe, date, rating)
                  # recipe, user, rating, date
    Recipecard.new(recipe, self, rating, date)

  end

  def declare_allergen(ingredient)
                  # user, ingredient
    Allergen.new(self, ingredient)

  end

  def myAllergens
    Allergen.all.select { |allergen| allergen.user == self}
  end

  def allergens
    myAllergens.map {|allergen| allergen.ingredient}
  end

  def top_three_recipes
    sorted_cards = myRCards.sort_by{|card| card.rating}
    recipes = sorted_cards.map { |card| card.recipe}
    recipes[-3..-1]
#binding.pry
  end
  def most_recent_recipe
    myRCards.sort_by {|card| card.date}[-1].recipe
  end

  # should return all recipes that don't contain
  # ingredients the user is allergic to
  # rc(recipe, user, rating, date)
  def safe_recipes
    rec_ing = myRCards.map { |card| card.recipe.myIngredients }
    # now I've the ingredients that are in my recipes
    # I will loop each ingredient
    # test if it exist in any of my allergens
    allerg_ing = rec_ing.select do |ing|
      Allergen.all.each {|allergen| allergen.ingredient == ing }
    end
    allerg_ing.map { |rc| rc[0].ingredient  }
  end
end # end of the class
