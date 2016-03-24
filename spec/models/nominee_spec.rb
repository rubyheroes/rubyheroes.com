require "rails_helper"

RSpec.describe Nominee do
  let(:nominee) { create(:nominee) }

  context "#merge_into(nominee)" do
    let!(:nomination) { create(:nomination, nominee: nominee) }
    let!(:new_nominee) { create(:nominee, :with_nomination, name: "Peter", github_username: "peter") }

    subject(:merge){ nominee.merge_into(new_nominee) }

    it "destroys the instance & switches its nominations to the passed nominee" do
      nominee_nomination_count = nominee.nominations.count
      new_nominee_nomination_count = new_nominee.nominations.count

      expect(merge).to be_truthy
      expect(nominee).to_not be_persisted
      expect(new_nominee.nominations).to include(nomination)
      expect(new_nominee.nominations.count).to eq(nominee_nomination_count + new_nominee_nomination_count)
    end

    context "when attempting to merge a nominee into itself" do
      let!(:new_nominee) { nominee }
      let!(:nomination) { create(:nomination, nominee: nominee) }

      it "not possible to merge into oneself" do
        expect(merge).to be_falsey
        expect(nominee).to be_persisted
        expect(nomination).to be_persisted
      end
    end
  end

  context "#github_username" do
    before { nominee.github_username = "@whatever" }

    subject(:github_username){ nominee.github_username }

    it "can't start with an @ symbol" do
      expect(github_username).not_to include("@")
    end
  end
end
