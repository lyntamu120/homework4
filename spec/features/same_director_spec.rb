require 'rails_helper'


RSpec.feature "same director movies", :type => :feature do
  scenario "User creates a new movie" do
    movie = Movie.create!(:title => 'Man in Black')
    id = movie.id
    visit edit_movie_path(id)
    fill_in 'Director', :with => 'David Lee'
    click_on 'Update Movie Info'
    expect(page).to have_text('Man in Black was successfully updated.')
  end
end

RSpec.feature "new movie", :type => :feature do
  scenario "User creates a new movie" do
    visit new_movie_path
    fill_in 'Title', :with => 'Man in Black'
    fill_in 'Director', :with => 'David Lee'
    click_on 'Save Changes'
    expect(page).to have_text('Man in Black was successfully created.')
  end
end

# RSpec.feature "new movie", :type => :feature do
#   scenario "User creates a new movie" do
#     movie1 = Movie.create!(:title => 'Man in Black', :director => 'David Lee')
#     id1 = movie1.id
#     Movie.create!(:title => 'Man in BlackII', :director => 'David Lee')
#     Movie.create!(:title => 'Star Wars', :director => 'George Lucas')
#     get "movies/14"
#     click_link('Find Movies With Same Director')
#     expect(page).to have_text('Man in BlackII')
#   end
# end