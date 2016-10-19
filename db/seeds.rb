# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
	  :name					=>"admin",
      :email                 => "admin@gmail.com",
      :password              => "123456",
      :password_confirmation => "123456",
      :is_admin				=> "1"
  )
  user.skip_confirmation!
  user.save!
  user = User.new(
  		:name				=>"member",
      :email                 => "member@gmail.com",
      :password              => "123456",
      :password_confirmation => "123456",
      :is_member				=> "1"
  )
  user.skip_confirmation!
  user.save!