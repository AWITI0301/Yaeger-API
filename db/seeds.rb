puts "Deleting game/user data..."

User.destroy_all
Game.destroy_all

puts "creating users..."
cady = User.create(email: "Cady@gmail.com", password: "Cady@1234", username: "cadybear" )
racheal = User.create(email: "Racheal@gmail.com", password: "Rachea1?234", username: "rahealbear" )
jeni= User.create(email: "Jeni@gmail.com", password: "Jeni#1234", username: "jenibear" )
jesse= User.create(email: "Jesse@gmail.com", password: "jesse^1234", username: "jessebear" )
mike= User.create(email: "Mike@gmail.com", password: "mike$1234", username: "mikey" )


puts "creating games..."
uno = Game.create(name: "uno", image_url: "https://m.media-amazon.com/images/I/71-1gqPVCuL._AC_SL1500_.jpg", likes: 0, user_id: 2)
solitaire = Game.create(name: "solitaire", image_url: "https://cf.geekdo-images.com/APsz5hbwZfFesAdQYgEgPw__opengraph/img/54YKgcPjUEu2swGy5_EzhV0uhig=/fit-in/1200x630/filters:strip_icc()/pic111209.jpg", likes: 0, user_id: 3)
snake = Game.create(name: "snake_and_ladder", image_url: "https://www.wikihow.com/images/thumb/6/64/Play-Snakes-and-Ladders-Step-9-Version-2.jpg/v4-460px-Play-Snakes-and-Ladders-Step-9-Version-2.jpg.webp", likes: 0, user_id: 2)


puts "creating comments..."
Comment.create(comment: "This is a nice game", game: uno, user: racheal)
Comment.create(comment: "This is hillarious", game: solitaire, user: jeni)



puts "seeding done"