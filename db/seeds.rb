# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   user = User.create([{ email: 'info@koshinkai.nl' }, { password: 'koshinkai' }, { password_confirmation: 'koshinkai' }])
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)





#Create an admin via seed
user = User.create(email: "info@koshinkai.nl", password: "koshinkai", password_confirmation: "koshinkai", invite_code: "hoi", role: 2)
#Create a example user


#Home category 
category = Category.create(menuname: "home", parent_id: nil, prive: false, url: "")
#Nieuws
category = Category.create(menuname: "nieuws", parent_id: nil, prive: false, url: "nieuws")

#Tarieven
category = Category.create(menuname: "tarieven", parent_id: nil,  prive: false, url: "tarieven")
category = Category.create(menuname: "gevorderd", parent_id: 3,  prive: false, url: "gevorderd")
category = Category.create(menuname: "semi-joren", parent_id: 3,  prive: false, url: "semi-joren")

#Aikido
category = Category.create(menuname: "aikido", parent_id: nil,  prive: false, url: "aikido")
#Koshinkai
category = Category.create(menuname: "koshinkai", parent_id: nil,  prive: false, url: "koshinkai")
#Agenda
category = Category.create(menuname: "agenda", parent_id: nil,  prive: false, url: "events")
#Media
category = Category.create(menuname: "media", parent_id: nil,  prive: false, url: "media")
#Contact
category = Category.create(menuname: "contact", parent_id: nil, prive: false, url: "contact")
#Lesmateriaal
category = Category.create(menuname: "lesmateriaal", parent_id: nil,  prive: true, url: "lesmateriaal")




