# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

products = Product.create(
    {
        name: "Death Star",
        model: "DS-1 Orbital Battle Station",
        manufacturer: "Imperial Department of Military Research, Sienar Fleet Systems",
        cost_in_credits: 1000000000000,
        length: 120000,
        max_atmosphering_speed: 'n/a',
        crew: 342953,
        passengers: 843342
    },
    {    name: "X-wing",
        model: "T-65 X-wing",
        manufacturer: "Incom Corporation",
        cost_in_credits: 149999,
        length: 12.5,
        max_atmosphering_speed: 1050,
        crew: 1,
        passengers: 0
    }
)