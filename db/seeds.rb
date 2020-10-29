puts "Creating treatments..."

treatments = [
  {
    name: "Headache Medication",
    description: "Medication that relieves sinuses and stops headaches in their tracks. Great for frequent migraines!"
  },
  {
    name: "Miracle Weight Loss Pill",
    description: "It's a miracle in pill form! Take one of these a day combined with a month long fast and you'll be skinny in no time."
  },
  {
    name: "Nutritional Supplement",
    description: "You don't need a doctor to stay healthy, and this all-in-one nutritional supplement has everything the human body might need. Like iron. It definitely has iron."
  },
  {
    name: "Pain Relief Medication",
    description: "Our simple over the counter pain relief does its job well by knocking you out for the next twenty four hours. WARNING: Do not ingest if pregnant, at risk of heart failure, narcoleptic, susceptible to suggestion, or prone to hangovers."
  },
  {
    name: "Mystery Pill",
    description: "Honestly this could do anything, we found a pallet of these in the back room and now we're selling them at a discount."
  },
  {
    name: "Wart Remover",
    description: "Apply this potent salve to any warts daily and they should clear up within a year or five."
  },
  {
    name: "Fire Liquer",
    description: "We also found this flaming hot liquor on the back shelf. It's a little too strong for me but I'm sure someone has a use for it."
  },
  {
    name: "Snail Trail Juice",
    description: "Harvested right here from real, organic snails. It makes your skin soft and your demeanor pleasant. WARNING: Do not ingest. We can't really vouch for how that'll affect you but we're pretty sure it'll be gross."
  }
]

puts "Seeding treatments..."

treatments.each do |tr|
  puts "Created treatment: #{tr.name}" if Treatment.create(tr)
end

puts "Treatments seeded..."
