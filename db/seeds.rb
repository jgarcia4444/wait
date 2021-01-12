# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
HealthTip.destroy_all
user = User.find(1)
previous_date = Time.now.day - 1.days
weight = Weight.create(weight_input: 180, user_id: user.id, created_at: previous_date)
HealthTip.create(:category => "Lose Weight", :title => "Less Empty Calories", :content => "In order to lose weight everyone knows you need to eat less calories, but eating less empty calories will keep you on your path longer." )
HealthTip.create(:category => "Gain Weight", :title => "More Protein", :content => "As all gym rats know in order to get bigger you need more protein." )