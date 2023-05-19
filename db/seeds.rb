# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  [
    {email: 'test@test', password: 'password'}
  ]
)

Customer.create!(
  [
    {name: "test", password: "testte"}
  ]
)

large_categories = LargeCategory.create!(
  [
    {name: "共通"},
    {name: "農業"}
  ]
)

meium_categories = MediumCategory.create!(
	[
	  {name: "野菜", large_category_id: large_categories[0].id},
    {name: "果樹", large_category_id: large_categories[1].id}
	]
)