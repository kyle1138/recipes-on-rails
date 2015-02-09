require 'HTTParty'
url = 'http://localhost:3000/recipes/'





def all
  url = 'http://localhost:3000/recipes.json'
  stuff = HTTParty.get(url)

  puts ""
  stuff.each do |x|
    puts x
    puts "next"
  end
end

def show
  url = 'http://localhost:3000/recipes/'
  puts 'enter the id number of the recipe you want'
  id = gets.chomp
  stuff = HTTParty.get(url + id + '.json')
  puts stuff
  puts "H O H"
  if stuff.name
    puts stuff["name"]
    puts stuff.ingredients
    puts stuff.instructions
  else
    puts stuff
  end
end


def make
  
  url = 'http://localhost:3000/recipes.json'
  puts "Please name your recipe"
  r_name = gets.chomp
  puts "Please enter the ingredients."
  r_ingr = gets.chomp
  puts "Please enter the instructions."
  r_inst = gets.chomp
  recipe_out = {body:{recipe: {name: r_name, ingredients: r_ingr, instructions: r_inst}}}
  puts recipe_out
  stuff = HTTParty.post(url , recipe_out)
  puts stuff


end


def main

  puts 'What would you like to do'\
  'Get (a)ll recipes?'\
  'Get (o)ne recipe?'\
  'Add a (n)ew recipe?'\
  'Or (d)elete recipe?'\

  ans = gets.chomp

  case ans
  when 'a'
    all
  when 'o'
    show
  when 'n'
    make
  when 'd'
    burn
  else
    main
  end

end


main
