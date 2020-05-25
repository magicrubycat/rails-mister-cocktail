# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
Ingredient.delete_all
Cocktail.delete_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

our_ingredients = open(url).read

ingredients = JSON.parse(our_ingredients)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts i.name
end

# Cocktail.create(name: "apero")
# Cocktail.create(name: "classic")
# Cocktail.create(name: "juicy")

# require "open-uri" - we already have it

picture = URI.open('https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/mojito-cocktails.jpg')
cocktail = Cocktail.new(name: 'mojito') # it hasn't been saved yet
cocktail.photos.attach(io: picture, filename: 'mojito.jpg', content_type: 'image/jpg')
cocktail.save

picture = URI.open('https://www.itsdrinkoclock.com/wp-content/uploads/2018/06/1529257250-460x460.jpg')
cocktail = Cocktail.new(name: 'moscow mule') # it hasn't been saved yet
cocktail.photos.attach(io: picture, filename: 'moscow_mule.jpg', content_type: 'image/jpg')
cocktail.save
