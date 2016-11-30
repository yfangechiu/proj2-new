# Pethugs Website- Rails Decal Final Project
PetHugs

Title:​ Rails Decal Final Project -- PetHugs

Team Members:​ Natasha Shams, Takara Satone, Jake Hong, Emma Chiu

Demo Link:​ https://www.youtube.com/watch?v=3t5DL0vkhqw

Idea: ​An application where users can post when and where they will be with their pets and other users can request to spend time with the pets posted.

Gems:

For compatibility with bootstrap template:
	gem 'bootstrap-sass', '~> 3.2.0' 
	gem 'autoprefixer-rails'

Models and Description:

User

	● has name, email, password, pet, and petname

	● users have many pets and have many requests


Request

	● has user_id, request_message, status (e.g. approved, pending, denied), and pet_id

	● belongs to a user and pet

Pet

	● has animal_type (e.g. dog, cat, etc.), image_url for owners to upload images of their pets, name, characteristic (e.g. Golden Retrievers, likes peanut butter, etc.), start_time indicating when the pet is available to play with, end_time indicating when the pet is no longer free, user_id for its owner. 

	● belongs to a user and has many requests

Features:

	● Users can log in and sign up for an account

	● Users can request to play with a pet

	● Users can post about their pet's availability

	● Users can accept or deny requests

	● Users can sort by rating, animal type, starting time, and starting date


Division of Labor:

	● Natasha: Made users model, made request model, implemented request_controller and pets_controller methods, added input validation and notices

	● Takara: Integrated ruby views with bootstrap

	● Jake: integrated date picker gem, made views and controllers

	● Emma: Completed the README, log in, and filtering.