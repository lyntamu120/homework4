require 'rails_helper'

RSpec.describe Movie, type: :model do
  before(:all)do
    @movie1 = Movie.create!(:title => "Man in Black1")
    @movie2 = Movie.create!(:title => "Man in Black2")
  end


  it "should have a mathcing title" do
    expect(@movie1.title).to eq("Man in Black1")
  end

  # it "has none to begin with" do
  #   expect(Movie.count).to eq 0
  # end
  #
  # it "has one after adding one" do
  #   expect(Movie.count).to eq 1
  # end

end
