# proj2-new
PetHugs

Title:​ Rails Decal Final Project -- PetHugs

Team Members:​ Natasha Shams, Takara Satone, Jake Hong, Emma Chiu

Demo Link:​ railsdecal.com

Idea: ​An application where users can post when and where they will be with their pets and allow other users to request spend time with the pets.

Models and Description:

User

● has name, email, password, pet, and petname

● users have many pets and have many requests


Review

● has rating (on a scale between 1 - 5, 5 being the best), comment, and pet_id (which pet does this review belong to)

● belongs to a pet

Request

● has user_id, request_message, status (e.g. approved, pending, denied), and pet_id

● belongs to a user and pet

Pet

● has animal_type (e.g. dog, cat, etc.), image_url for owners to upload images of their pets, name, characteristic (e.g. Golden Retrievers, likes peanut butter, etc.), start_time indicating when the pet is available to play with, end_time indicating when the pet is no longer free, overall rating that is an average of ratings by users that have spent time with the pet, user_id for its owner. 

● belongs to a user and has many requests and has one overall review

Features:

● Users can log in and sign up for an account

● Users can request to play with a pet

● Users can post about their pet's availability

● Users can review a pet, giving it a numerical rating and a text review

● Users can accept or deny requests

● Users can sort by rating, animal type, starting time, and ending time

Division of Labor:

● Natasha: Made users

● Takara: In charge of the design and HTML/CSS

● Jake: Made views and controllers

● Emma: Completed the README, log in, and filtering.