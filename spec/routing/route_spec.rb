require 'rails_helper'

RSpec.describe "routing to index", :type => :routing do

  it "routes /movies/index to movies#index" do
    expect(:get => "movies/").to route_to(
                                        :controller => "movies",
                                        :action => "index"
                                    )
  end

  it "routes /movies/new to movies#new" do
    expect(:get => "movies/new").to route_to(
                                              :controller => "movies",
                                              :action => "new"
                                          )
  end


  it "routes /movies/1 to movies#show id = 1" do
    expect(:get => "movies/1").to route_to(
                                        :controller => "movies",
                                        :action => "show",
                                        :id => "1"
                                    )
  end

  it "routes /movies/1/edit to movies#edit id = 1" do
    expect(:get => "movies/1/edit").to route_to(
                                        :controller => "movies",
                                        :action => "edit",
                                        :id => "1"
                                    )
  end

  it "routes /movies/show_same_director?id=1 movies#show_same_director" do
    expect(:get => "movies/show_same_director?id=1").to route_to(
                                           :controller => "movies",
                                           :action => "show_same_director",
                                           :id => "1"
                                       )
  end
end