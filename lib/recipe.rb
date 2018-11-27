class Recipe
  attr_reader :name

  @@all = []
  def self.all
    @@all
  end

  def self.most_popular
    # should return the recipe instance with the highest number of users
    # (the recipe that has the most recipe cards)

    # get all rcards
    # count up user occurences
    # return recipe with most user occurences
    # using hash, key = user instance, value = count

    # create empty hash with default of 0
    # loop through each Recipecard and read its recipe
    # then make it a key inside of hash
    # while incrementing its value by 1
    # now hash equals to each recipe and its occurences
    # then sort it by its value and access last ele
    # and now we have the recipe with most users inside of an array
    # with its value as 2nd ele in the array
    # return the 1st ele (recipe instance)
    hash = Hash.new(0)
    Recipecard.all.each do |card|
      hash[card.recipe] += 1
    end
    hash.sort_by{|k, v| v}[-1][0]
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def myRCards
    Recipecard.all.select { |recipecard| recipecard.recipe == self}
  end


  def users
    myRCards.select{|card| card.recipe == self}.map {|card| card.user}
  end

# Ingr
  def myIngredients
    RecipeIngredient.all.select { |recipeing| recipeing.recipe == self}
  end

  def ingredients
    myIngredients.map {|ing| ing.ingredient}
  end

  def allergens
    ingredients.select do |ing|
      ing.myAllergens.length > 0
    end
  end

# should take an array of ingredient instances as an argument,
# and associate each of those ingredients with this recipe
  def add_ingredients(arr_of_ingr) # create new RecipeIngredients
    arr_of_ingr.each do |ing|
      #                   recipe, ingredient
      RecipeIngredient.new(self, ing)
    end
  end

end # End of the class
