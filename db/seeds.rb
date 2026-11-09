require 'net/http'
require 'json'

SpeciesHabitat.destroy_all
Observation.destroy_all
Species.destroy_all
Habitat.destroy_all
Category.destroy_all

# 1. Define categories
categories = {
  'Mammal' => Category.create!(name: 'Mammal', description: Faker::Lorem.paragraph),
  'Bird' => Category.create!(name: 'Bird', description: Faker::Lorem.paragraph),
  'Fish' => Category.create!(name: 'Fish', description: Faker::Lorem.paragraph),
  'Reptile' => Category.create!(name: 'Reptile', description: Faker::Lorem.paragraph)
}

# 2. Create Habitats
habitats = 10.times.map do
  Habitat.create!(
    region_name: Faker::Address.unique.state,
    climate: ['Tropical', 'Temperate', 'Arid', 'Polar', 'Coastal'].sample
  )
end

# 3. Curated animals without any image URLs
curated_animals = [
  # Mammals
  { name: 'Lion', category: 'Mammal', diet: 'Carnivore', status: 'Vulnerable' },
  { name: 'Tiger', category: 'Mammal', diet: 'Carnivore', status: 'Endangered' },
  { name: 'Gray Wolf', category: 'Mammal', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Grizzly Bear', category: 'Mammal', diet: 'Omnivore', status: 'Vulnerable' },
  { name: 'African Elephant', category: 'Mammal', diet: 'Herbivore', status: 'Endangered' },
  { name: 'Plains Zebra', category: 'Mammal', diet: 'Herbivore', status: 'Near Threatened' },
  { name: 'Giant Panda', category: 'Mammal', diet: 'Herbivore', status: 'Vulnerable' },
  { name: 'Red Fox', category: 'Mammal', diet: 'Omnivore', status: 'Least Concern' },
  { name: 'Red Deer', category: 'Mammal', diet: 'Herbivore', status: 'Least Concern' },
  { name: 'Reticulated Giraffe', category: 'Mammal', diet: 'Herbivore', status: 'Vulnerable' },
  { name: 'Cheetah', category: 'Mammal', diet: 'Carnivore', status: 'Vulnerable' },
  { name: 'Koala', category: 'Mammal', diet: 'Herbivore', status: 'Vulnerable' },
  { name: 'Chimpanzee', category: 'Mammal', diet: 'Omnivore', status: 'Endangered' },
  { name: 'Snow Leopard', category: 'Mammal', diet: 'Carnivore', status: 'Vulnerable' },
  { name: 'Hippopotamus', category: 'Mammal', diet: 'Herbivore', status: 'Vulnerable' },
  { name: 'White Rhinoceros', category: 'Mammal', diet: 'Herbivore', status: 'Near Threatened' },
  { name: 'Mountain Gorilla', category: 'Mammal', diet: 'Herbivore', status: 'Endangered' },
  { name: 'Meerkat', category: 'Mammal', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Kangaroo', category: 'Mammal', diet: 'Herbivore', status: 'Least Concern' },
  { name: 'Humpback Whale', category: 'Mammal', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Bottlenose Dolphin', category: 'Mammal', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'River Otter', category: 'Mammal', diet: 'Carnivore', status: 'Near Threatened' },
  { name: 'North American Beaver', category: 'Mammal', diet: 'Herbivore', status: 'Least Concern' },
  { name: 'European Hedgehog', category: 'Mammal', diet: 'Omnivore', status: 'Least Concern' },
  { name: 'Moose', category: 'Mammal', diet: 'Herbivore', status: 'Least Concern' },

  # Birds
  { name: 'Bald Eagle', category: 'Bird', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Scarlet Macaw', category: 'Bird', diet: 'Omnivore', status: 'Vulnerable' },
  { name: 'Snowy Owl', category: 'Bird', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Greater Flamingo', category: 'Bird', diet: 'Omnivore', status: 'Least Concern' },
  { name: 'Emperor Penguin', category: 'Bird', diet: 'Carnivore', status: 'Near Threatened' },
  { name: 'Ruby-throated Hummingbird', category: 'Bird', diet: 'Omnivore', status: 'Least Concern' },
  { name: 'Atlantic Puffin', category: 'Bird', diet: 'Carnivore', status: 'Vulnerable' },
  { name: 'Mute Swan', category: 'Bird', diet: 'Herbivore', status: 'Least Concern' },
  { name: 'Toco Toucan', category: 'Bird', diet: 'Omnivore', status: 'Least Concern' },
  { name: 'Peregrine Falcon', category: 'Bird', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Common Kingfisher', category: 'Bird', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Peacock', category: 'Bird', diet: 'Omnivore', status: 'Least Concern' },

  # Fish
  { name: 'Great White Shark', category: 'Fish', diet: 'Carnivore', status: 'Vulnerable' },
  { name: 'Ocellaris Clownfish', category: 'Fish', diet: 'Omnivore', status: 'Least Concern' },
  { name: 'Blue Tang', category: 'Fish', diet: 'Omnivore', status: 'Least Concern' },
  { name: 'Manta Ray', category: 'Fish', diet: 'Carnivore', status: 'Endangered' },
  { name: 'Common Seahorse', category: 'Fish', diet: 'Carnivore', status: 'Vulnerable' },
  { name: 'Lionfish', category: 'Fish', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Mandarin Fish', category: 'Fish', diet: 'Carnivore', status: 'Least Concern' },

  # Reptiles
  { name: 'Panther Chameleon', category: 'Reptile', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Green Sea Turtle', category: 'Reptile', diet: 'Omnivore', status: 'Endangered' },
  { name: 'Ball Python', category: 'Reptile', diet: 'Carnivore', status: 'Least Concern' },
  { name: 'Green Iguana', category: 'Reptile', diet: 'Herbivore', status: 'Least Concern' },
  { name: 'Bearded Dragon', category: 'Reptile', diet: 'Omnivore', status: 'Least Concern' },
  { name: 'Tokay Gecko', category: 'Reptile', diet: 'Carnivore', status: 'Least Concern' }
]

# 4. Create records cleanly without images
curated_animals.each do |item|
  species = Species.create!(
    name: item[:name],
    scientific_name: "#{Faker::Lorem.word.capitalize} #{Faker::Lorem.word.downcase}",
    diet: item[:diet],
    conservation_status: item[:status],
    category: categories[item[:category]]
  )
  
  species.habitats << habitats.sample(rand(1..3))

  rand(4..8).times do
    Observation.create!(
      location_name: "#{Faker::Address.city}, #{Faker::Address.country}",
      latitude: rand(-85.0..85.0).round(6),
      longitude: rand(-180.0..180.0).round(6),
      observed_at: Faker::Time.backward(days: 365),
      species: species
    )
  end
end

puts "Database Seed Complete! Total Records: #{Category.count + Species.count + Habitat.count + Observation.count}"