require 'json'
require 'open-uri'

Ingredient.destroy_all

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
url_reader = open(url).read
scraper = JSON.parse(url_reader)

ingredients = scraper['drinks'] # Array of hashes
ingredients.each do |ingredient|
  new_ingredient = Ingredient.new(name: ingredient['strIngredient1'])
  new_ingredient.save!
end
