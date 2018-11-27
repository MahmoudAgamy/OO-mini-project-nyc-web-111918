require_relative '../config/environment.rb'

r1 = Recipe.new("Soup")
r2 = Recipe.new("Chicken over rice")
r3 = Recipe.new("Pizza")

u1 = User.new("Simon")
u2 = User.new("Mahmoud")
u3 = User.new("Mike")

i1 = Ingredient.new("rice")
i2 = Ingredient.new("pasta")
i3 = Ingredient.new("meat")
i4 = Ingredient.new("bread")
#                   recipe, user, rating, date
rc1 = Recipecard.new(r1,u1,7,"11/27/2018")
rc2 = Recipecard.new(r2,u2,2,"11/26/2018")
rc3 = Recipecard.new(r2,u3,10,"11/25/2018")
rc4 = Recipecard.new(r3,u2,0,"11/24/2018")
rc5 = Recipecard.new(r3,u1,9,"11/23/2018")
rc6 = Recipecard.new(r1,u1,1,"11/22/2018")
rc7 = Recipecard.new(r1,u3,10,"11/25/2018")
rc8 = Recipecard.new(r2,u3,10,"11/25/2018")

# =>                       recipe, ingredient
ri1 = RecipeIngredient.new(r1,i1)
ri2 = RecipeIngredient.new(r2,i3)
ri3 = RecipeIngredient.new(r3,i2)
ri4 = RecipeIngredient.new(r3,i1)
ri5 = RecipeIngredient.new(r1,i3)
ri6 = RecipeIngredient.new(r1,i4)

#                 user, ingredient
a1 = Allergen.new(u1, i1)
a2 = Allergen.new(u2, i2)
a3 = Allergen.new(u3, i2)
a5 = Allergen.new(u3, i3)
a4 = Allergen.new(u1, i4)



binding.pry
