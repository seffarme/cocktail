require 'json'
require 'open-uri'
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
puts "cleaning seed"
Ingredient.destroy_all
puts "create seed"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
result = JSON.parse(ingredients_serialized)

result["drinks"].each do |drink|
  ingredient = Ingredient.create!(name: drink["strIngredient1"])
  puts ingredient.name
end
# puts (ingredient.count)

Cocktail.create(name: "Cocktail_test1")
Cocktail.create(name: "Mint Julep")
Cocktail.create(name: "Mojito")
Cocktail.create(name: "Whiskey Sour")
