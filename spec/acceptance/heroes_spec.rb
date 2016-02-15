require 'acceptance/acceptance_helper'

feature "Heroes", %q{
  In order to view past heroes
  Without first going to the home page
  I should be redirected
} do

  before { 3.times { create(:hero) } }

  scenario "Viewing past heroes" do
    visit heroes_path
    current_path.should eq root_path
  end

end


