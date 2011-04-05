require 'acceptance/acceptance_helper'

feature "Nominations", %q{
  In order to nominate a Ruby Hero
  As a member of the Ruby community
  I want to submit a github profile
} do

  scenario "Nomination" do
    visit root_path
    fill_in 'nomination', :with => 'envylabs'
    click_button 'Nominate'
    page.should have_content 'http://github.com/envylabs'
  end

end


