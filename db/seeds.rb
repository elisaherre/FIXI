require "open-uri"

if Rails.env.development?
  FixerCategory.destroy_all
  Category.destroy_all
  User.destroy_all
  Fixer.destroy_all
end

puts "creando categoría 1..."
category1 = Category.new(name: "carpintería")
category1.save!

puts "creando categoría 2..."
category2 = Category.new(name: "plomería")
category2.save!

puts "creando categoría 3..."
category3 = Category.new(name: "jardinería")
category3.save!

puts "creando usuario 1..."
file = URI.open("https://avatars.githubusercontent.com/u/139592608?v=4")
user1 = User.new(email: "elisa@gmail.com", password: "123456", address: "calle 123", name: "Elisa")
user1.photo.attach(io: file, filename: "elisa.png", content_type: "image/png")
user1.save!

puts "creando usuario 2..."
file = URI.open("https://avatars.githubusercontent.com/u/88845568?v=4")
user2 = User.new(email: "facundo@gmail.com", password: "123456", address: "calle 123", name: "Facundo")
user2.photo.attach(io: file, filename: "facundo.png", content_type: "image/png")
user2.save!

puts "creando usuario 3..."
file = URI.open("https://avatars.githubusercontent.com/u/128540417?v=4")
user3 = User.new(email: "dominique@gmail.com", password: "123456", address: "calle 123", name: "Dominique")
user3.photo.attach(io: file, filename: "dominique.png", content_type: "image/png")
user3.save!

puts "creando fixer 1..."
file = URI.open("https://img.freepik.com/foto-gratis/tablero-mdf-corte-carpintero-dentro-taller_23-2149451056.jpg?w=1800&t=st=1693925690~exp=1693926290~hmac=dde493c4fb855edde9b09ec6406c1d61960f621f6d12623783bbd768bc1bfd2e")
fixer1 = Fixer.new(email: "carpintero@gmail.com", password: "123456", address: "calle 123", name: "Gabriel")
fixer1.photo.attach(io: file, filename: "carpintero.png", content_type: "image/png")
fixer1.save!
fixer1.fixer_categories.create!(category: category1)

puts "creando fixer 2..."
file = URI.open("https://img.freepik.com/foto-gratis/hombre-mayor-mono-azul-sujetando-llave-inglesa_1187-3382.jpg?w=1480&t=st=1693925640~exp=1693926240~hmac=63edac72f74c8a4d7746408cea87f9efbb8bd6f7e9d0c08b69d7ec7a3a4ec4ef")
fixer2 = Fixer.new(email: "plomero@gmail.com", password: "123456", address: "calle 123", name: "Pepe")
fixer2.photo.attach(io: file, filename: "plomero.png", content_type: "image/png")
fixer2.save!
fixer1.fixer_categories.create!(category: category2)

puts "creando fixer 3..."
file = URI.open("https://img.freepik.com/foto-gratis/alegre-anciano-cortando-arbustos-demasiado-grandes_651396-1547.jpg?w=1800&t=st=1693925532~exp=1693926132~hmac=0ddc7a16a110e54c5dfe9a92acf7788d80c9440db5fac560343ea9679fb2b526")
fixer3 = Fixer.new(email: "jardinero@gmail.com", password: "123456", address: "calle 123", name: "Mateo")
fixer3.photo.attach(io: file, filename: "jardinero.png", content_type: "image/png")
fixer3.save!
fixer1.fixer_categories.create!(category: category3)
