# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

john = User.create! :id=> 1, :name => 'John Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
natasha = User.create! :id=> 2, :name => 'Natasha Shams', :email => 'natashashams22@gmail.com', :password => 'password', :password_confirmation => 'password'
emma = User.create! :id=> 3, :name => 'Emma Chiu', :email => 'emmachiu@gmail.com', :password => 'password', :password_confirmation => 'password'
jake = User.create! :id=> 4, :name => 'Jake Hong', :email => 'jakehong@gmail.com', :password => 'password', :password_confirmation => 'password'
takara = User.create! :id=> 5, :name => 'Takara Satone', :email => 'takarasatone@gmail.com', :password => 'password', :password_confirmation => 'password'


pet1 = Pet.create! :id=> 1, :animal_type => "Dog", :name => 'Pluto', :duration => 3, :characteristic => 'soft brown fur, very playful', :address => '2534 Benvenue Avenue', :image_url=> "http://img.lum.dolimg.com/v1/images/open-uri20150422-20810-2unaal_3530efaa.jpeg?region=0,0,600,600&width=320", :user_id=> 2, :start_date=> "2016-11-30", :start_time=> "2000-01-01 17:00:00"

pet2 = Pet.create! :id=> 2, :animal_type => "Cat", :name => 'Kibby', :duration => 2.5, :characteristic => 'fluffy cat, yellowish fur, aggressive, may bite, savage', :address => '2534 Benvenue Avenue', :image_url=> "https://c1.staticflickr.com/9/8395/8676788483_bb7c1978fd_b.jpg", :user_id=> 2, :start_date=> "2016-12-25", :start_time=> "2000-01-01 10:00:00"

pet3 = Pet.create! :id=> 3, :animal_type => "Dog", :name => 'Miso', :duration => 2.5, :characteristic => '3 month old Corgi, likes to sleep, loves being cuddled', :address => '2520 Channing Way', :image_url=> "https://s-media-cache-ak0.pinimg.com/736x/ba/a0/dd/baa0ddbe307094f6427d9b6feb6dd8ad.jpg", :user_id=> 3, :start_date=> "2016-12-01", :start_time=> "2000-01-01 14:00:00"
