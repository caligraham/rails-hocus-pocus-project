# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


oz = User.create(username: "wizardofoz", email: "wizard@oz.com", profile_pic: "https://lh3.googleusercontent.com/proxy/ipvyHWEZedENEc6iE6lSs6m5T_ZOHSI1Z2jCdorNTcHWaJu56qMbKA0UDWAI2jXR5Z4uDzAw8iSfGPGhZKDOm619um7lMQw8lTlmXUS5aZjenmBAGx5xmdMbFPGPiLQoWTcuSbbXfe_O5B2RBN67efk", bio: "The ruler of the Land of Oz, living it up in the Emerald City. ", password: "pw") 

Spellbook.create(title: "Secrets of the Emerald City", category: "Enchantment", level: 5, user_id: 1)

Spell.create(name: "Magic Armor", category: "Enchantment", level: 5, description: "1 large onion, coarse salt, 1 glass of water, 1 photo of yourself, 1 white candle.", user_id: 1, spellbook_id: 1)

