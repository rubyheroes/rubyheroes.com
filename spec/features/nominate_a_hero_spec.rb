require "spec_helper"

RSpec.feature "Nominate a Hero" do
  before do
    $voting_enabled = true
  end

  context "from the home page" do
    before do
      visit root_path
      fill_in :nominee, with: "jimweirich"
      click_on "Next"
    end

    it "redirects to the full nomination for" do
      expect(current_path).to eq(new_nomination_path)
    end
  end

  context "from the nomination form" do
    before do
      visit new_nomination_path
      vote_for_jim
      click_on "Nominate"
    end

    it "succeeds" do
      expect(page).to have_content("Thank you for caring!")
    end

    context "when attempting to vote for the same person again" do
      before do
        visit new_nomination_path
        vote_for_jim
        click_on "Nominate"
      end

      it "displays an error" do
        expect(page).to have_content("You can only nominate someone once.")
      end
    end

    context "with a vote for the same person a year ago" do
      before do
        Timecop.freeze(Date.today - (1.year + 1.month))
        visit new_nomination_path

        fill_in "Nominee's GitHub Username", with: "pedro"
        fill_in "Your Name", with: "Lyra Silvertongue"
        fill_in "Your Email", with: "lyra@jordancollege.co.uk"
        fill_in "Why is this person your Ruby Hero?", with: "Jim was a wonderful guy and I wish I could have had one more conversation with him."
        click_on "Nominate"

        Timecop.return
      end

      it "succeeds" do
        visit new_nomination_path

        fill_in "Nominee's GitHub Username", with: "pedro"
        fill_in "Your Name", with: "Lyra Silvertongue"
        fill_in "Your Email", with: "lyra@jordancollege.co.uk"
        fill_in "Why is this person your Ruby Hero?", with: "Jim was a wonderful guy and I wish I could have had one more conversation with him."\

        click_on "Nominate"

        expect(page).to have_content("Thank you for caring!")
      end
    end
  end

  def vote_for_jim
    fill_in "Nominee's GitHub Username", with: "jimweirich"
    fill_in "Your Name", with: "Lyra Silvertongue"
    fill_in "Your Email", with: "lyra@jordancollege.co.uk"
    fill_in "Why is this person your Ruby Hero?", with: "Jim was a wonderful guy and I wish I could have had one more conversation with him."
  end
end
