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
    {name: "農業"},
    {name: "園芸"},
    {name: "畜産"},
    {name: "食品化学"},
    {name: "農業土木"},
    {name: "林業"},
    {name: "造園"}
  ]
  )

medium_categories = MediumCategory.create!(
  [
    {name: "種子・植物体", large_category_id: large_categories[0].id},
    {name: "栽培用具・機器具", large_category_id: large_categories[0].id},
    {name: "環境調査", large_category_id: large_categories[0].id},
    {name: "土・肥料", large_category_id: large_categories[0].id}
  ]
  )

small_categories = SmallCategory.create!(
  [
    {name: "種子・植物体", medium_category_id: medium_categories[0].id},
  ]
  )

items = Item.create!(
  [
    {
      name: "イネ",
      reading: "イネ",
      information: "イネ科",
      commentary: "",
      large_category_id: large_categories[0].id,
      medium_category_id: medium_categories[0].id,
      small_category_id: small_categories[0].id
    },

    {
      name: "トウモロコシ",
      reading: "トウモロコシ",
      information: "イネ科",
      commentary: "",
      large_category_id: large_categories[0].id,
      medium_category_id: medium_categories[0].id,
      small_category_id: small_categories[0].id
    },

    {
      name: "ダイズ",
      reading: "ダイズ",
      information: "マメ科",
      commentary: "",
      large_category_id: large_categories[0].id,
      medium_category_id: medium_categories[0].id,
      small_category_id: small_categories[0].id
    }
  ]
  )

Quiz.create!(
  [
    {
      question: "イネの科名はなんですか",
      correct_answer: "イネ科",
      item_id: items[0].id
    },

    {
      question: "トウモロコシの科名はなんですか",
      correct_answer: "イネ科",
      item_id: items[1].id
    },

    {
      question: "ダイズの科名はなんですか",
      correct_answer: "マメ科",
      item_id: items[2].id
    }
  ]
  )