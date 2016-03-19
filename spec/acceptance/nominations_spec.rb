require 'acceptance/acceptance_helper'

feature "Nominations", %q{
  In order to nominate a Ruby Hero
  As a member of the Ruby community
  I want to submit a GitHub username
} do

  before do
    $voting_enabled = true
  end

  scenario "Nomination" do
    visit root_path
    fill_in 'nominee', with: 'envylabs'
    click_button 'Next'
    expect(find_field("Nominee's GitHub Username").value).to have_content "envylabs"
  end

end


