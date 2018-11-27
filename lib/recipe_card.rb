class Recipecard
  attr_reader :recipe, :user, :date, :rating

  @@all = []
  def self.all
    @@all
  end

  def initialize(recipe, user, rating, date)
    @recipe = recipe
    @user = user
    @rating = rating
    @date = date
#Time.now().split(" ")[0]
    @@all << self
  end

end # End of the class
