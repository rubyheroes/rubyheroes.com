require 'acceptance/acceptance_helper'

feature "Nominations", %q{
  In order to nominate a Ruby Hero
  As a member of the Ruby community
  I want to submit a GitHub username
} do

  scenario "Nomination" do
    visit root_path
    fill_in 'nominee', with: 'envylabs'
    click_button 'Next'
    find_field("Nominee's GitHub Username").value.should have_content "envylabs"
  end

end


