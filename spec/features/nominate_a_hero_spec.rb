require "spec_helper"

RSpec.feature "Nominate a Hero" do
  context "from the home page" do
    before do
      $voting_enabled = true
      visit root_path
      fill_in :nominee, with: "jimweirich"
      click_on "Next"
    end

    it "redirects to the full nomination for" do
      expect(current_path).to eq(new_nomination_path)
    end
  end

  context "from the nomination form" do
  end
end
